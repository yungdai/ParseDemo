//
//  Course.h
//  ParseDemo
//
//  Created by Yung Dai on 2015-05-13.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <Parse/Parse.h>

@interface Course : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSString *courseDuration;


@end
