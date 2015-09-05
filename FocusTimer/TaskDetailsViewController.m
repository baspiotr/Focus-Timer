//
//  TaskDetailsViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 05/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskDetailsViewController.h"

@interface TaskDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeSpentLabel;

@end

@implementation TaskDetailsViewController


- (void)setTaskNameOnLabel:(NSString *)name
{
    NSLog(@"name = '%@'",name);
    
    self.taskNameLabel.text = name;
    
      self.taskNameLabel.text = @"asf";
}




@end
