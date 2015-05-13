//
//  Course.m
//  ParseDemo
//
//  Created by Yung Dai on 2015-05-13.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "Course.h"
#import <Parse/PFObject+Subclass.h>

@implementation Course

// dynamic direction essentially tells the complier
// trust us, this property or method is on it's way.

@dynamic courseName;
@dynamic courseDuration;


+ (void)load {
    
    // register this Course object as a subclass of the PFObject
    [self registerSubclass];
}

// let Parse know what the Subclass Object Name is
+ (NSString *)parseClassName {
    return @"Course";
}

@end
