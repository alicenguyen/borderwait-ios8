//
//  DetailViewController.h
//  Borderwait2
//
//  Created by Alice Nguyen on 12/16/14.
//  Copyright (c) 2014 Calit2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

