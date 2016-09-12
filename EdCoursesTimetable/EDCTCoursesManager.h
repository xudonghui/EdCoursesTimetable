//
//  EDCTCoursesManager.h
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDCTCourses.h"

@interface EDCTCoursesManager : NSObject

@property (strong, nonatomic) NSArray *myCourses;

+ (instancetype)sharedCourcesManager;
// Singleton Method
- (void)retriveCourses;
- (void)saveCourses:(NSArray *)courses;
- (NSArray *)unarchiverCourses;
- (void)deleteCourse;

@end
