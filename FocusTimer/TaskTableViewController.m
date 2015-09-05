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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[[TaskStore sharedStore]allTasks]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [[[[TaskStore sharedStore]allTasks]objectAtIndex:indexPath.row] taskName];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TaskStore sharedStore].currentSelectedTaskName = [[[[TaskStore sharedStore]allTasks]objectAtIndex:indexPath.row] taskName];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"taskName"])
    {
        // Get reference to the destination view controller
        TaskDetailsViewController *td = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        
       td.name = [[[[TaskStore sharedStore]allTasks]objectAtIndex:row] taskName];
       
        

        
        
    }
    
    
}




@end
