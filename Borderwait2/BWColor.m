//
//  BWColor.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "BWColor.h"

@implementation BWColor

- (id) init
{
    self = [super init];
    
    self.gray300 = [UIColor colorWithRed:0.47 green:0.56 blue:0.61 alpha:1];
    self.mint500 = [UIColor colorWithRed:0.24 green:0.73 blue:0.55 alpha:1];
    self.black = [UIColor colorWithRed:0.11 green:0.16 blue:0.18 alpha:1];
    self.warningRed =[UIColor colorWithRed:0.94 green:0.6 blue:0.6 alpha:1];
    
    return self;
    
}
@end
