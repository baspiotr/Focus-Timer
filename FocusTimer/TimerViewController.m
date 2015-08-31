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

@interface TimerViewController ()


@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UIProgressView *timeProgressView;
@property (nonatomic, weak) IBOutlet UILabel *startClickableLabel;

@property (strong, nonatomic) IBOutlet UIView *mainView;


@end

@implementation TimerViewController

static int secondsToEnd = 25*60;
NSTimer *timer;
int counter=0;

int startSecondsValue;


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
        self.timeLabel.text = @"00:00";
        
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
    
    
    double procentOfComplete = ((((double)secondsToEnd/(double)startSecondsValue)*-100)+100)/100;
    
//    NSLog(@"procent = %f",procentOfComplete);
    
    [self.timeProgressView setProgress:procentOfComplete animated:YES];
    
    
    
    
    
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
    
    NSLog(@"myColor r = %d , b = %d , g = %d",myColor.red,myColor.blue,myColor.green);
    
    self.mainView.backgroundColor = [UIColor colorWithRed:myColor.red/255.0 green:myColor.green/255.0 blue:myColor.blue/255.0 alpha:1];
    

    
    
}









@end
