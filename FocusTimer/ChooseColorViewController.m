//
//  ChooseColorViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 31/08/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "ChooseColorViewController.h"
#import "TimerViewController.h"

@interface ChooseColorViewController ()

@end



@implementation ChooseColorViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int position = (int)indexPath.row ;
    
    
    ChoosenColorRGBValues myColor;
    
    
    switch (position) {
        case 0:
        {
            myColor.red=245;
            myColor.green=67;
            myColor.blue=55;
            [TimerViewController setColorStructure:myColor];
        }
            break;
        case 1:
        {
            myColor.red=51;
            myColor.green=204;
            myColor.blue=255;
            [TimerViewController setColorStructure:myColor];
        }
            break;
        case 2:
        {
            myColor.red=193;
            myColor.green=108;
            myColor.blue=206;
            [TimerViewController setColorStructure:myColor];
        }
            break;
            
        default:
            break;
    }
    
    
    
}




@end
