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
                                         laneType:@"standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"1h25m"
                                      currentWait:@"1h14m"
                                        averageWait:11
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"],
                        
                       [[Port alloc] initWithName:@"San Ysidro"
                                         portType:@"passenger"
                                         laneType:@"nexus/sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"30m"
                                      currentWait:@"20m"
                                        averageWait:11
                                     userReported:@"23m"
                                       lastUpdate:@"At Noon PST"],
                        
                       [[Port alloc] initWithName:@"San Ysidro"
                                         portType:@"passenger"
                                         laneType:@"ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"50m"
                                      currentWait:@"51m"
                                        averageWait:7
                                     userReported:@"1h20m"
                                       lastUpdate:@"At Noon PST"], nil
                        
                        ];
    NSArray *portOM = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"1h25m"
                                      currentWait:@"1h14m"
                                        averageWait:11
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"],
                       
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"nexus/sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"30m"
                                      currentWait:@"20m"
                                        averageWait:11
                                     userReported:@"23m"
                                       lastUpdate:@"At Noon PST"],
                       
                       [[Port alloc] initWithName:@"OtayMesa"
                                         portType:@"passenger"
                                         laneType:@"ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"50m"
                                      currentWait:@"51m"
                                        averageWait:7
                                     userReported:@"1h 20m"
                                       lastUpdate:@"At Noon PST"], nil
                       
                       ];
    NSArray *portCM = [NSArray arrayWithObjects:
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"standard"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"1h25m"
                                      currentWait:@"1h14m"
                                        averageWait:11
                                     userReported:@"1h3m"
                                       lastUpdate:@"At Noon PST"],
                       
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"nexus/sentri"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"30m"
                                      currentWait:@"20m"
                                        averageWait:11
                                     userReported:@"23m"
                                       lastUpdate:@"At Noon PST"],
                       
                       [[Port alloc] initWithName:@"Calexico/Mexicali"
                                         portType:@"passenger"
                                         laneType:@"ready"
                                        longitude:-117.0292374
                                         latitude:32.5421692
                                         distance:20
                                      lanesOpen:@"50m"
                                      currentWait:@"51m"
                                        averageWait:7
                                     userReported:@"1h20m"
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
