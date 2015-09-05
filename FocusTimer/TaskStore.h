//
//  TaskStore.h
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Task;

@interface TaskStore : NSObject

@property (nonatomic, readonly) NSArray *allTasks;
@property (nonatomic) NSString *currentSelectedTaskName;

+ (instancetype)sharedStore;

- (Task *)createTaskWithName:(NSString *)name;
- (void)removeTask:(Task *)task;


@end
