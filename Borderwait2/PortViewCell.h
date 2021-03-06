//
//  PortViewCell.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWColor.h"
#import "BWStyleKit.h"

@interface PortViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *portNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentWaitLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageWaitLabel;
@property (weak, nonatomic) IBOutlet UILabel *userReportLabel;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (weak, nonatomic) IBOutlet UIView *statusDotView;
@property (nonatomic) BWColor *color;
@property (weak, nonatomic) IBOutlet UILabel *laneTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *openLanesLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentWaitTitle;
@property (weak, nonatomic) IBOutlet UILabel *userReportTitle;
@property (weak, nonatomic) IBOutlet UILabel *averageWaitTitle;

-(void) setStyle;
-(void) drawDot;

@end
