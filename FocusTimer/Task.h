//
//  Task.h
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Task : NSManagedObject

@property (nonatomic, copy) NSString *taskName;
@property (nonatomic, copy) NSString *idKey;
@property (nonatomic) int secondsSpent;

@end
