//
//  Task.h
//  FocusTimer
//
//  Created by Piotr Basiński on 03/09/15.
//  Copyright (c) 2015 Basiński Software House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

- (instancetype)initWithTaskName:(NSString *)name;

@property (nonatomic, copy) NSString *taskName;
@property (nonatomic, copy) NSString *idKey;



@end
