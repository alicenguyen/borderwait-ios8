//
//  StatusDotView.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/22/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "DotView.h"

@implementation DotView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [BWStyleKit drawGreenDot];
}
@end

@implementation GreenDot
- (void)drawRect:(CGRect)rect {
    [BWStyleKit drawGreenDot];
}

@end

@implementation RedDot
- (void)drawRect:(CGRect)rect {
    [BWStyleKit drawRedDot];
}

@end

@implementation YellowDot
- (void)drawRect:(CGRect)rect {
    [BWStyleKit drawYellowDot];
}

@end