//
//  TaskDetailsViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 05/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskDetailsViewController.h"

@interface TaskDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation TaskDetailsViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = self.name;
}



@end
