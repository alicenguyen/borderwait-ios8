//
//  PortMapViewController.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/20/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortMapViewController.h"
#import "Port.h"

@implementation PortMapViewController
@synthesize mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
   
    self.portData = [[PortData alloc] init];
    
}

// Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
}

-(void) mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(32.5149469, -117.03824710000004), 10000, 10000);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
 
    NSArray *portKeys = [self.portData getPortNames];
    
    
    for(int i = 0; i < portKeys.count; ++i) {
        NSString *portName = [portKeys objectAtIndex:i];
        double latitude = [[[self.portData getPortDetail:portName] objectAtIndex:0] latitude];
        double longitude = [[[self.portData getPortDetail:portName] objectAtIndex:0] longitude];
        
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        point.title = portName;
        [self.mapView addAnnotation:point];
        
    }
    
    
}
@end
