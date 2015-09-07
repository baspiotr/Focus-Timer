//
//  ChooseTimeViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 29/08/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "ChooseTimeViewController.h"
#import "TimerViewController.h"

@interface ChooseTimeViewController () <UITableViewDelegate>

@end

@implementation ChooseTimeViewController

int const min5InSeconds  = 5*60;
int const min10InSeconds = 10*60;
int const min15InSeconds = 15*60;
int const min20InSeconds = 20*60;
int const min25InSeconds = 25*60;
int const min30InSeconds = 30*60;
int const min35InSeconds = 35*60;

- (instancetype)init
{
    self.tableView.delegate = self;

    return self;
}

int seconds = 25*60;

+ (int)getSeconds
{
    return seconds;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
            seconds = min5InSeconds;
            break;
        case 1:
            seconds = min10InSeconds;
            break;
        case 2:
            seconds = min15InSeconds;
            break;
        case 3:
            seconds = min20InSeconds;
            break;
        case 4:
            seconds  = min25InSeconds;
            break;
        case 5:
            seconds = min30InSeconds;
            break;
        case 6:
            seconds = min35InSeconds;
            break;
            
        default:
            break;
    }
    
}


@end
