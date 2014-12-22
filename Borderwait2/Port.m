//
//  Port.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "Port.h"

@implementation Port

-(id) initWithName: (NSString*) name
          portType: (NSString*) _type
          laneType: (NSString*) _lType
         longitude: (double) _long
          latitude: (double) _lat
          distance: (double)_dist
       lanesOpen: (NSString*) _currWait
       currentWait: (NSString*) _avgWait
         averageWait: (double) _numLanes
      userReported: (NSString*) _usrReport
        lastUpdate: (NSString*) _update
        
{
    self = [super init];
    
    self.name = name;
    self.laneType = _lType;
    self.portType = _type;
    self.longitude = _long;
    self.latitude = _lat;
    self.distance = _dist;
    self.currentWait = _currWait;
    self.averageWait = _avgWait;
    self.openLanesCount = _numLanes;
    self.userReport = _usrReport;
    self.lastUpdate = _update;
    self.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    
    return self;
}


@end
