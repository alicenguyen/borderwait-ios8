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
#import "BWColor.h"

@interface PortMapListViewController : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) IBOutlet UIView *portTableContainer;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) PortData *portData;
@property (nonatomic) NSArray* portNames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BWColor *color;
@end
