//
//  TaskStore.m
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskStore.h"
#import "Task.h"

@interface TaskStore ()

@property (nonatomic) NSMutableArray *privateTasks;

@end

@implementation TaskStore

+ (instancetype)sharedStore
{
    static TaskStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[TaskStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        
        if (!_privateTasks) {
            _privateTasks = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allTasks
{
    return [self.privateTasks copy];
}

- (Task *)createTaskWithName:(NSString *)name
{
    Task *task = [[Task alloc] initWithTaskName:name];
    
    [self.privateTasks addObject:task];
    
    return task;
}

- (void)removeTask:(Task *)item
{
    [self.privateTasks removeObjectIdenticalTo:item];
}




@end
