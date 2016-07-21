//
//  ViewController.h
//  RomalAssessment
//
//  Created by Romal on 7/20/16.
//  Copyright © 2016 romal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *DealersArray;

@end

