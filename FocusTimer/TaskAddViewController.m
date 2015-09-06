//
//  TaskAddViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 04/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskAddViewController.h"
#import "TaskStore.h"
#import "TaskTableViewController.h"

@interface TaskAddViewController()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;

@end


@implementation TaskAddViewController

- (IBAction)saveTask:(id)sender {
    
    NSString *name = [[NSString alloc]initWithString:self.taskNameTextField.text];
    
    if(![name isEqual:@""]) {
        [[TaskStore sharedStore]createTaskWithName:name];
    }
}



@end
