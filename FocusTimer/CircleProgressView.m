//
//  CircleProgressView.m
//  FocusTimer
//
//  Created by Piotr Basiński on 31/08/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()


@end



@implementation CircleProgressView

UIBezierPath *pathInside;
CGPoint center;
float radius;

- (void)setUp
{
    CGRect bounds = self.bounds;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.x + bounds.size.height / 2.0;
    
    radius = MIN(bounds.size.width, bounds.size.height)/2;
    
    self.progress = 0;
    
}


- (void)drawRect:(CGRect)rect
{
    
    [self setUp];
    
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    [path addArcWithCenter:center radius:radius-30 startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    path.lineWidth = 3;
    
    [[UIColor whiteColor]setStroke];
    
    [path stroke];
    
    [self setProgress:5];
    [self setProgress:15];
    [self setProgress:25];
    [self setProgress:35];
    [self setProgress:45];
    [self setProgress:55];

    
    
}

- (void)setProgress:(float)progress;
{
    
    float procent = progress;
    
    if(!pathInside){
    pathInside = [[UIBezierPath alloc]init];
    }
    
    procent = procent * 3.6;
    
    float radian = procent * (M_PI/180);
    
    
    [pathInside removeAllPoints];
    
    [pathInside addArcWithCenter:center radius:radius-30 startAngle:0 endAngle:radian clockwise:YES];
   

    [[UIColor blackColor]setStroke];
    pathInside.lineWidth = 3;

    [pathInside stroke];
    
}



@end
