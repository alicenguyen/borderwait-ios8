//
//  PortMapViewController.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/20/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortMapViewController.h"
#import "Port.h"
#import "PortViewCell.h"
#import "BWColor.h"
#import "BWStyleKit.h"

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
    
    self.portNames = [self.portData getPortNames];
    
    self.color = [[BWColor alloc] init];
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

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PortViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PortCell"];
    [cell setStyle];
    [cell drawDot];
    
    NSString *portKey = [self.portNames objectAtIndex:indexPath.section];
    NSArray *portLanes = [self.portData getPortDetail:portKey];
    Port *lane = [portLanes objectAtIndex:indexPath.row];
    
    

//    CLLocationCoordinate2D location = port.coordinate;
//    double distance = port.distance;
//    double laneCount = port.openLanesCount;
    
    cell.portNameLabel.text = @"";
    int index = indexPath.row;
    switch(index){
            case 0:
            cell.currentWaitLabel.textColor = BWStyleKit.green500;
            cell.averageWaitLabel.textColor = BWStyleKit.green500;
            cell.userReportLabel.textColor = BWStyleKit.green500;
            break;
            case 1:
            cell.currentWaitLabel.textColor = BWStyleKit.amber500;
            cell.averageWaitLabel.textColor = BWStyleKit.amber500;
            cell.userReportLabel.textColor = BWStyleKit.amber500;
            break;
            case 2: 
            cell.currentWaitLabel.textColor = BWStyleKit.red500;
            cell.averageWaitLabel.textColor = BWStyleKit.red500;
            cell.userReportLabel.textColor = BWStyleKit.red500;
            break;
    }
    cell.currentWaitLabel.text = lane.currentWait;
    cell.averageWaitLabel.text = lane.averageWait;
    cell.userReportLabel.text = lane.userReport;
    
    
    return cell;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.portNames count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.portNames objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *portLanes = [self.portData getPortDetail:[self.portNames objectAtIndex:section]];
    return [portLanes count];
}


@end
