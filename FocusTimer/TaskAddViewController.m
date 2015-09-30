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

@interface TaskAddViewController() <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;

@end

@implementation TaskAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.taskNameTextField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *name = [[NSString alloc]initWithString:textField.text];
    
    if(![name isEqual:@""]) {
        [[TaskStore sharedStore]createTaskWithName:name];
    }
    
    [textField resignFirstResponder];
    return YES;
}

@end
