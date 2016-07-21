//
//  ViewController.m
//  RomalAssessment
//
//  Created by Romal on 7/20/16.
//  Copyright © 2016 romal. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Customer1";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"response" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    // Parse the string into JSON
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSLog(@"json%@",json);
    _DealersArray=[[NSMutableArray alloc]init];
    _DealersArray=[json valueForKey:@"NearbyDealers"];
    // Get all object
    _tableView.dataSource=self;
    _tableView.delegate =self;
    
}

#pragma mark -TableView Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [_DealersArray count];
    }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier =@"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text =[[_DealersArray objectAtIndex:indexPath.row]valueForKey:@"DealerName"];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"Distance:%@",[[_DealersArray objectAtIndex:indexPath.row]valueForKey:@"Distance"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MapViewController *mapVc=[self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapVc.locationArray=_DealersArray;
    mapVc.selectedIndex=indexPath.row;
    [self.navigationController pushViewController:mapVc animated:YES];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName=@"NearbyDealers";
    return sectionName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
