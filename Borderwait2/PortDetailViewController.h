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

@interface PortDetailViewController : UIViewController
@property ( nonatomic) IBOutlet PortIconView *portIcon;
@property (weak, nonatomic) Port *port;
@property (weak, nonatomic) IBOutlet UILabel *portNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *portTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *laneTypeLabel;

@end
