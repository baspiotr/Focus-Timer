//
//  TaskDetailsViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 05/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskDetailsViewController.h"
#import "TaskStore.h"
#import "Task.h"

@interface TaskDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeSpentLabel;

@end

@implementation TaskDetailsViewController




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.nameLabel.text = self.name;
    [self.nameLabel sizeToFit];
    
    
    self.timeSpentLabel.text = [NSString stringWithFormat:@"%d min",[[[TaskStore sharedStore]currentSelectedTask]secondsSpent]/60];
}

@end
