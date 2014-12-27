//
//  PortSymbolView.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/27/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortIconView.h"

@implementation PortIconView

-(id) init:(Port*) port
{
    self = [super init];
    if(self){
        self.port = port;
    }
    return self;
    
}
- (void)drawRect:(CGRect)rect
{
    [BWStyleKit drawPortSymbolWithPortInitials:self.port.portInitials color: self.port.color ];
}

@end
