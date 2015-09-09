//
//  Task.m
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "Task.h"

@implementation Task

@dynamic taskName;
@dynamic idKey;
@dynamic secondsSpent;

- (void)awakeFromInsert
{
    [super awakeFromInsert];
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    self.idKey = key;
    self.secondsSpent = 0;
}


- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"Item name %@",self.taskName];
    
    return descriptionString;
}

@end


