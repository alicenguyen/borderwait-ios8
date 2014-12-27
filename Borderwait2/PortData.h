//
//  PortList.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Port.h"

@interface PortData : NSObject

@property (nonatomic) NSMutableDictionary *ports;

- (NSArray*) getPortNames;
- (NSArray*) getPortDetail: (NSString*) portName;
- (NSInteger) getCount;

@end
