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
    // icon
    self.portIcon.port = self.port;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.portNameLabel.text = self.port.name;
    self.portTypeLabel.text = self.port.portType;
    self.laneTypeLabel.text = self.port.laneType;
    
    self.color = [[BWColor alloc] init];
    self.sections = [[NSArray alloc] initWithObjects:@"CBP Border Wait Times", @"User iReports", @"Traffic Forecast", nil ];
    
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
    if(section == 1) {
        return 2;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    if(indexPath.section == 0) {
        height = 80;
    } else {
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
    
    if (section == 1) {
        // Submit iReport button
        CGFloat yCenter = sectionCell.bounds.size.height / 2 + 20;
        
        UIButton *submitReportBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [submitReportBtn sizeToFit];
        submitReportBtn.center =CGPointMake(350, yCenter);
         //[[UIButton alloc ]initWithFrame:CGRectMake(xPos, 17, 70, 20)];
        
//        submitReportBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [sectionCell addSubview:submitReportBtn];
        
    }
    
    return sectionCell;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CBPDetailCell"];
    } else {
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
