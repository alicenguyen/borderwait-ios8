//
//  PortDetailViewController.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/26/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortDetailViewController.h"
#import "BWColor.h"
#import "PortHeaderSectionCellTableViewCell.h"


@interface PortDetailViewController ()
@property (nonatomic) NSArray *sections;
@property (nonatomic) BWColor *color;
@end

@implementation PortDetailViewController

-(void)viewWillAppear:(BOOL)animated {
    // Port icon
    self.portIcon.port = self.port;

    // Back button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(Back)];
    self.navItem = backButton;
}

- (IBAction)Back
{
    [self dismissViewControllerAnimated:YES completion:nil]; // ios 6
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.portNameLabel.text = self.port.name;
    self.portTypeLabel.text = self.port.portType;
    self.laneTypeLabel.text = self.port.laneType;
    
    self.color = [[BWColor alloc] init];
    self.sections = [[NSArray alloc] initWithObjects:@"CBP Border Wait Times", @"User iReports", @"Traffic Forecast", nil ];
    
//    CGRect frame = self.toobar.frame;
//    [self.toobar setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height + 20)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return 1;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    if(indexPath.section == 0 ) {
        height = 80;
    } else if (indexPath.section == 2){
        height = 100;
    }else {
        height = 65;
    }
    
    return height;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1. Dequeue the custom header cell
    if (section < 2) {
    PortHeaderSectionCellTableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"SectionHeaderCell"];
    
    sectionCell.headerLabel.text = [self.sections objectAtIndex:section];
    [sectionCell.headerLabel sizeToFit];
    
    // 2. Set the various properties
    
    // 3. Programmically create time updates label
    CGFloat xPos = sectionCell.headerLabel.frame.size.width + sectionCell.headerLabel.frame.origin.x + 10;
    UILabel *updateLabel = [[UILabel alloc] initWithFrame:CGRectMake(xPos, 13, 132, 20)];
    updateLabel.text = @" @3:00 pm PST";
    updateLabel.backgroundColor = [UIColor clearColor];
    updateLabel.textColor = [self.color gray300];
    updateLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    
    [sectionCell addSubview:updateLabel];
   
    // User iReports section
    if (section == 1) {
        // Submit iReport button
        CGFloat yCenter = sectionCell.bounds.size.height / 2 + 20;
        UIButton *submitReportBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [submitReportBtn sizeToFit];
        submitReportBtn.center =CGPointMake(350, yCenter);
        [sectionCell addSubview:submitReportBtn];
    }
        return sectionCell;
    }
    
    // Traffic forecast section
    UITableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:@"ForecastHeaderSectionCell"];
    
    return sectionCell;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CBPDetailCell"];
    }else if (indexPath.section ==2 ) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ForecastGraphCell"];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UserReportDetailCell"];
    }
    
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
