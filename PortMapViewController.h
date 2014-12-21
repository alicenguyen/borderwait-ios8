//
//  PortMapViewController.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/20/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PortData.h"

@interface PortMapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *portTableContainer;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) PortData *portData;

@end
