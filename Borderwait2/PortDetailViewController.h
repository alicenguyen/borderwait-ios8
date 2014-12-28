//
//  PortDetailViewController.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/26/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortIconView.h"
#import "PortMapListViewController.h"
#import "Port.h"

@interface PortDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property ( nonatomic) IBOutlet PortIconView *portIcon;
@property (weak, nonatomic) Port *port;
@property (weak, nonatomic) IBOutlet UILabel *portNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *portTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *laneTypeLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;

@end
