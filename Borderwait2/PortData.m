//
//  PortList.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortData.h"


@implementation PortData


- (id) init
{
    self = [super init];
    
    UIColor *c1 = [UIColor colorWithRed:1 green:0.34 blue:0.13 alpha:1];
    UIColor *c2 = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1];
    UIColor *c3 = [UIColor colorWithRed:0.49 green:0.34 blue:0.76 alpha:1];
    // San Ysidro
    NSArray *portSY = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"San Ysidro" portType:@"passenger" laneType:@"Standard" longitude:-117.0292374 latitude:32.5421692 distance:20 lanesOpen:16 currentWait:@"90m" averageWait:@"30m" userReported:@"1h3m" lastUpdate:@"At Noon PST" color: c1 portInitials:@"SY" ] ,
                       [[Port alloc] initWithName:@"San Ysidro" portType:@"passenger" laneType:@"Sentri" longitude:-117.0292374 latitude:32.5421692 distance:20 lanesOpen:16 currentWait:@"90m" averageWait:@"20m" userReported:@"1h9m" lastUpdate:@"At Noon PST" color:c1 portInitials:@"SY" ] ,
                       [[Port alloc] initWithName:@"San Ysidro" portType:@"passenger" laneType:@"Ready" longitude:-117.0292374 latitude:32.5421692 distance:20 lanesOpen:8 currentWait:@"25m" averageWait:@"10m" userReported:@"20m" lastUpdate:@"At Noon PST" color:c1 portInitials:@"SY" ], nil ];
    
    NSArray *portOM = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"Standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:4
                                      currentWait:@"1h10m"
                                      averageWait:@"1h12m"
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"
                                            color:c2
                                     portInitials:@"OM" ],
                       
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"Sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:6
                                      currentWait:@"1h10m"
                                      averageWait:@"1h05m"
                                     userReported:@"1h10m"
                                       lastUpdate:@"At Noon PST"
                                            color:c2
                                     portInitials:@"OM"],
                       
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"Ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:2
                                      currentWait:@"10m"
                                      averageWait:@"5m"
                                     userReported:@"9m"
                                       lastUpdate:@"At Noon PST"
                                            color:c2
                                     portInitials:@"OM" ], nil
                       
                       ];
    NSArray *portCM = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"Standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:10
                                      currentWait:@"1h10m"
                                      averageWait:@"1h02m"
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"
                                            color:c3
                                     portInitials:@"CX"],
                       
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"Sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:4
                                      currentWait:@"40m"
                                      averageWait:@"30m"
                                     userReported:@"23m"
                                       lastUpdate:@"At Noon PST"
                                            color:c3
                                     portInitials:@"CX"],
                       
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"Ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                        lanesOpen:0
                                      currentWait:@"closed"
                                      averageWait:@"closed"
                                     userReported:@"closed"
                                       lastUpdate:@"At Noon PST"
                                            color:c3
                                     portInitials:@"CX"], nil
                       
                       ];
    
    
    self.ports = [[NSMutableDictionary alloc] init];
    [self.ports setObject:portSY forKey:@"San Ysidro"];
    [self.ports setObject:portOM forKey:@"Otay Mesa"];
    [self.ports setObject:portCM forKey:@"Calexico"];
    
    
    
    
    return self;
}

- (NSArray*) getPortNames
{
    return [self.ports allKeys];
}

- (NSArray*) getPortDetail:(NSString *)portName
{
    return [self.ports objectForKey:portName];
}
-(NSInteger) getCount
{
    int count  = 0;
    NSArray *ports = self.getPortNames;
    for(int i = 0; i<[ports count]; i++ )
    {
        count += [[ports objectAtIndex:i ] count];
    }
    return count;
}

@end
