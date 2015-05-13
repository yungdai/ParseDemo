//
//  ReturnObject.h
//  ParseDemo
//
//  Created by Yung Dai on 2015-05-13.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

// a Course Object already exists and has been instantiated
@class Course;


@interface ReturnObject : NSObject


+(Course *) returnCourse;

@end
