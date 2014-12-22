//
//  PortViewCell.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWColor.h"

@interface PortViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *portNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (nonatomic) BWColor *color;
@property (weak, nonatomic) IBOutletCollection(UILabel) NSArray *fieldLabels;
@property (weak, nonatomic) IBOutlet UILabel *currentWaitLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageWaitLabel;
@property (weak, nonatomic) IBOutlet UILabel *userReportLabel;

-(void) setStyle;
@end
