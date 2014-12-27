//
//  PortDetailViewController.m
//  Borderwait2
//
//  Created by Alice Nguyen on 12/26/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import "PortDetailViewController.h"

@interface PortDetailViewController ()

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
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
