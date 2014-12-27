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
    
    
    // San Ysidro
    NSArray *portSY = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"San Ysidro"
                                         portType:@"passenger"
                                         laneType:@"Standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:16
                                      currentWait:@"90m"
                                        averageWait:@"30m"
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"],
                        
                       [[Port alloc] initWithName:@"San Ysidro"
                                         portType:@"passenger"
                                         laneType:@"Sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:5
                                      currentWait:@"60m"
                                        averageWait:@"20m"
                                     userReported:@"53m"
                                       lastUpdate:@"At Noon PST"],
                        
                       [[Port alloc] initWithName:@"San Ysidro"
                                         portType:@"passenger"
                                         laneType:@"Ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:8
                                      currentWait:@"25m"
                                        averageWait:@"10m"
                                     userReported:@"20m"
                                       lastUpdate:@"At Noon PST"], nil
                        
                        ];
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
                                       lastUpdate:@"At Noon PST"],
                       
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
                                       lastUpdate:@"At Noon PST"],
                       
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
                                       lastUpdate:@"At Noon PST"], nil
                       
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
                                       lastUpdate:@"At Noon PST"],
                       
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
                                       lastUpdate:@"At Noon PST"],
                       
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
                                       lastUpdate:@"At Noon PST"], nil
                       
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
