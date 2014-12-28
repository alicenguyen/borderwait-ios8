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
    self.sections = [[NSArray alloc] initWithObjects:@"CBP Border Wait Times", @"User iReports", @"Overview", nil ];
    
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
    return 3;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
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
    CGFloat yPos = 15+2;
    UILabel *updateLabel = [[UILabel alloc] initWithFrame:CGRectMake(xPos, yPos, 132, 20)];
    updateLabel.text = @" @3:00 pm PST";
    updateLabel.backgroundColor = [UIColor clearColor];
    updateLabel.textColor = [self.color gray300];
    updateLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
   
    [sectionCell addSubview:updateLabel];
    
    return sectionCell;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PortDetailCell"];
    
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
