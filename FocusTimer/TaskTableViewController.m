//
//  TaskTableViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 04/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskTableViewController.h"
#import "TaskStore.h"
#import "Task.h"
#import "TimerViewController.h"
#import "TaskDetailsViewController.h"

@interface TaskTableViewController ()

@end

@implementation TaskTableViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TaskStore sharedStore]allTasks]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    cell.textLabel.text = [[[[TaskStore sharedStore]allTasks]objectAtIndex:indexPath.row] taskName];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TaskStore sharedStore].currentSelectedTask = [[[TaskStore sharedStore]allTasks]objectAtIndex:indexPath.row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"taskName"])
    {
        
        TaskDetailsViewController *td = [segue destinationViewController];
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        td.name = [[[[TaskStore sharedStore]allTasks]objectAtIndex:row] taskName];
    }
}

@end
