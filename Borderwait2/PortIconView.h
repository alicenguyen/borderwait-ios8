//
//  PortSymbolView.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/27/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BWStyleKit.h"
#import "Port.h"

@interface PortIconView : UIView
-(id) init:(Port*) port;
@property (nonatomic) Port *port;
@end
