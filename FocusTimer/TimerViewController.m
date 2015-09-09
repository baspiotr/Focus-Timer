//
//  TimerViewController.m
//  FocusTimer
//
//  Created by Piotr Basiński on 29/08/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TimerViewController.h"
#import "ChooseTimeViewController.h"
#import "ChooseColorViewController.h"
#import "CircleProgressView.h"
#import "TaskStore.h"
#import "Task.h"


@interface TimerViewController ()

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *startClickableLabel;
@property (nonatomic, weak) IBOutlet UIView *mainView;
@property (nonatomic, weak) IBOutlet CircleProgressView *circleView;
@property (nonatomic, weak) IBOutlet UILabel *currentTaskNameLabel;

@end

@implementation TimerViewController

int secondsToEnd = 25*60;
NSTimer *timer;
int counter=0;

int startSecondsValue;
double procentOfComplete;
ChoosenColorRGBValues myColor;

#pragma mark timer operations

- (IBAction)runTimer:(id)sender {
    
    if(counter%2==0) {
        
        secondsToEnd = [ChooseTimeViewController getSeconds];
        
        startSecondsValue = secondsToEnd;
        
        self.startClickableLabel.text = @"Stop";
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runOperations:) userInfo:nil repeats:YES];
        
    } else {
        
        self.startClickableLabel.text = @"Start";
        
        [timer invalidate];
        timer = nil;
        
        if([[TaskStore sharedStore]currentSelectedTask]){
            [[TaskStore sharedStore]addSecondsToTaskTime:startSecondsValue toTask:[[TaskStore sharedStore]currentSelectedTask]];
        }
        
        int min = startSecondsValue/60;
        
        if(min==5) {
            self.timeLabel.text = [NSString stringWithFormat:@"0%d:00",min];
        } else {
            self.timeLabel.text = [NSString stringWithFormat:@"%d:00",min];
        }
    }
    
    counter++;
    
    if(counter>10000)counter=1;
    
}

- (void)runOperations:sender
{
    secondsToEnd--;
    
    int minutes = secondsToEnd / 60;
    int seconds = secondsToEnd - (minutes * 60);
    
    NSString *timeStr = [NSString stringWithFormat:@"%2d:%2d",minutes,seconds];
    
    procentOfComplete = ((((double)secondsToEnd/(double)startSecondsValue)*-100)+100);
    
    self.circleView.progressProcent = procentOfComplete;
    
    [self.circleView setNeedsDisplay];
    
    self.timeLabel.text = timeStr;
    
    if(secondsToEnd == 0){
        [timer invalidate];
        timer = nil;
    }
}

#pragma mark view

- (void)viewDidLoad
{
    myColor.red=245;
    myColor.green=67;
    myColor.blue=55;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setBackgorundColorFromRGB];
    
    self.currentTaskNameLabel.text = [[[TaskStore sharedStore]currentSelectedTask]taskName];
    
    int time = [ChooseTimeViewController getSeconds]/60;
    NSString *temp;
    
    if(time>=10){
        temp = [NSString stringWithFormat:@"%d:00",time];
    } else {
        temp = [NSString stringWithFormat:@"0%d:00",time];
    }
    
    self.timeLabel.text = temp;
}


#pragma mark from settings

+ (void)setColorStructure:(ChoosenColorRGBValues)color
{
    myColor.red = color.red;
    myColor.blue = color.blue;
    myColor.green = color.green;
}


- (void)setBackgorundColorFromRGB
{
    self.mainView.backgroundColor = [UIColor colorWithRed:myColor.red/255.0 green:myColor.green/255.0 blue:myColor.blue/255.0 alpha:1];
}


@end
