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
            seconds = 5*60;
            break;
        case 1:
            seconds = 10*60;
            break;
        case 2:
            seconds = 15*60;
            break;
        case 3:
            seconds = 20*60;
            break;
        case 4:
            seconds  = 25*60;
            break;
        case 5:
            seconds = 30*60;
            break;
        case 6:
            seconds = 35*60;
            break;
            
        default:
            break;
    }
    
}













@end
