//
//  TaskStore.m
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import "TaskStore.h"
#import "Task.h"
@import CoreData;

@interface TaskStore ()

@property (nonatomic) NSMutableArray *privateTasks;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

- (NSString *)itemArchivePath;

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
        
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        
        NSString *path = self.itemArchivePath;
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            @throw [NSException exceptionWithName:@"OpenFailure"
                                           reason:[error localizedDescription]
                                         userInfo:nil];
        }
      
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        
        [self loadAllItems];
    }
    return self;
}

- (void)loadAllItems
{
    if (!self.privateTasks) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [NSEntityDescription entityForName:@"Task"
                                             inManagedObjectContext:self.context];
        
        request.entity = e;
        
        NSError *error;
        NSArray *result = [self.context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        self.privateTasks = [[NSMutableArray alloc] initWithArray:result];
        
    }
}

- (NSArray *)allTasks
{
    return [self.privateTasks copy];
}

- (Task *)createTaskWithName:(NSString *)name
{
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:self.context];
    
    task.taskName = name;
    [self.privateTasks addObject:task];
    
    return task;
}

- (void)removeTask:(Task *)task
{
    [self.context deleteObject:task];
    [self.privateTasks removeObjectIdenticalTo:task];
}

- (void)addSecondsToTaskTime:(int)seconds toTask:(Task *)task
{
    task.secondsSpent +=seconds;
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}


- (BOOL)saveChanges
{
    NSError *error;
    
    BOOL successful = [self.context save:&error];
    
    if(!successful){
        NSLog(@"Error save: %@", [error localizedDescription]);
    }
    return successful;
}

@end





