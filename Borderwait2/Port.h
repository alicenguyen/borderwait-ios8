//
//  Port.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/21/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Port : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString* currentWait;
@property (nonatomic) NSString* userReport;
@property (nonatomic) NSString* averageWait;
@property (nonatomic) NSString *lastUpdate;
@property (nonatomic) NSString* portType;
@property (nonatomic) NSString* laneType;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (nonatomic) double distance;
@property (nonatomic) double openLanesCount;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSString* portInitials;
@property (nonatomic) UIColor* color;

- (id) initWithName: (NSString*) name
          portType: (NSString*) _type
          laneType: (NSString*) _lType
         longitude: (double) _long
          latitude: (double) _lat
          distance: (double)_dist
         lanesOpen: (double) _numLanes
       currentWait: (NSString*) _avgWait
       averageWait: (NSString*) _avgWait
      userReported: (NSString*) _userReport
        lastUpdate: (NSString*) _lastUpdate
              color: (UIColor*) col
       portInitials: (NSString*) portInit;


@end
