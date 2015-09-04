//
//  Task.m
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithTaskName:(NSString *)name
{
    self = [super init];
    
    if(self) {
        self.taskName = name;
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        self.idKey = key;
    }
    
    return self;
    
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"Item name %@",self.taskName];
    
    return descriptionString;
}



@end


