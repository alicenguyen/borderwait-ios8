//
//  PortMapViewController.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/20/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortMapListViewController.h"
#import "Port.h"
#import "PortViewCell.h"
#import "BWColor.h"
#import "BWStyleKit.h"
#import "PortDetailViewController.h"
#import "PortIconView.h"
#import "PortHeaderSectionCellTableViewCell.h"

@implementation PortMapListViewController
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
    
    NSInteger index = indexPath.row;
    
    switch(index){
        case 0:
            cell.currentWaitLabel.textColor = [self.color green800];
            cell.averageWaitLabel.textColor = [self.color green800];
            cell.userReportLabel.textColor  = [self.color green800];
            break;
            
        case 1:
            cell.currentWaitLabel.textColor = [self.color orange800];
            cell.averageWaitLabel.textColor = [self.color orange800];
            cell.userReportLabel.textColor  = [self.color orange800];
            break;
            
        case 2: 
            cell.currentWaitLabel.textColor = [self.color red800];
            cell.averageWaitLabel.textColor = [self.color red800];
            cell.userReportLabel.textColor  = [self.color red800];
            break;
            
    }
    
    cell.currentWaitLabel.text = lane.currentWait;
    cell.averageWaitLabel.text = lane.averageWait;
    cell.userReportLabel.text  = lane.userReport;
    cell.laneTypeLabel.text    = lane.laneType;
    
    // Open lanes label
    if(lane.openLanesCount == 1 )
    {
        NSString *lanesText = [NSString stringWithFormat:@"%@ lane open", @(lane.openLanesCount).stringValue];
        cell.openLanesLabel.text = lanesText;
    }
    else if(lane.openLanesCount > 1 )
    {
        NSString *lanesText = [NSString stringWithFormat:@"%@ lanes open", @(lane.openLanesCount).stringValue];
        cell.openLanesLabel.text = lanesText;
    }
    else
    {
        cell.openLanesLabel.text = @"";
        cell.currentWaitLabel.text = lane.currentWait;
        cell.averageWaitLabel.text = @"";
        cell.userReportLabel.text  = @"";
        // change text color
        cell.currentWaitLabel.textColor = [UIColor grayColor];
        
    }
    
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.portNames count];
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    PortHeaderSectionCellTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"SectionHeaderCell"];
    sectionCell.headerLabel.text =  [self.portNames objectAtIndex:section];
    return sectionCell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *portLanes = [self.portData getPortDetail:[self.portNames objectAtIndex:section]];
    return [portLanes count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PortDetailSegue"])
    {
        PortDetailViewController *vc = (PortDetailViewController*)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *portKey = [self.portNames objectAtIndex:indexPath.section];
        NSArray *portLanes = [self.portData getPortDetail:portKey];
        Port *lane = [portLanes objectAtIndex:indexPath.row];
        vc.port = lane;
    }
}

@end
