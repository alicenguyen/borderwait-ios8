//
//  PortViewCell.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortViewCell.h"
#import "BWStyleKit.h"

@implementation PortViewCell

- (void) setStyle
{
    self.color = [[BWColor alloc] init];
    
    self.distanceLabel.textColor = self.color.gray300;
    
    
}
-(void) drawDot
{
}
    


@end
