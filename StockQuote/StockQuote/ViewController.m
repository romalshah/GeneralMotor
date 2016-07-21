//
//  ViewController.m
//  StockQuote
//
//  Created by Romal on 7/20/16.
//  Copyright © 2016 Romal Shah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *responseTxtView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchDataFromURL:@"https://www.google.com/finance/info?q=GM"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 Based on the URL provided will call session data task and fill the response retrieved on to the text view.
 @param NSString * - URL which will be given to NSURLSession for data request
*/
- (void)fetchDataFromURL:(NSString *) url {
    
    //adding an activity indicator inorder to show that data is getting retrieeved
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.color = [UIColor blackColor];
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    
    //creating a NSURLsession data task
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //creating a range to remove the intial content from the data which is coming as due to that we are not able to parse the json serialization.
        NSRange range = NSMakeRange(4, [data length] - 5);
        NSData *refinedData = [data subdataWithRange:range];
        NSJSONSerialization *jsonSerialization = [NSJSONSerialization JSONObjectWithData:refinedData options:0 error:nil];
        
        //calling dispatch main queue as we need to update the UI.
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.responseTxtView.text = [NSString stringWithFormat:@"%@", jsonSerialization];
            [activityView stopAnimating];
        });
    }];
    
    [dataTask resume];
}

@end
