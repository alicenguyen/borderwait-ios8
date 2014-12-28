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
    self.green800 = [UIColor colorWithRed:0.18 green:0.49 blue:0.2 alpha:1];
    self.orange800 = [UIColor colorWithRed:0.94 green:0.42 blue:0 alpha:1];
    self.red800 = [UIColor colorWithRed:0.72 green:0.11 blue:0.11 alpha:1];
    return self;
    
}
@end
