//
//  EDCTCourses.h
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDCTCourses : NSObject

@property (nonatomic, copy) NSString *fullCode;
@property (nonatomic, copy) NSString *courseName;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *room;
@property (nonatomic, copy) NSString *building;
@property (nonatomic, copy) NSString *campus;
@property (nonatomic, copy) NSString *dayVerbose;
@property (nonatomic, copy) NSNumber *start;
@property (nonatomic, copy) NSNumber *end;
@property (nonatomic, copy) NSArray  *weekPattern;

- (instancetype)initWithResponseObject:(NSDictionary *)dictionary;

@end
