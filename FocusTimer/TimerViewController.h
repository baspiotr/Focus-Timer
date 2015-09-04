//
//  TimerViewController.h
//  FocusTimer
//
//  Created by Piotr Basiński on 29/08/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseColorViewController.h"

@interface TimerViewController : UIViewController

- (void)setBackgorundColorFromRGB;
+ (void)setColorStructure:(ChoosenColorRGBValues)color;


@end




