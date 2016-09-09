//
//  EDCTPreferences.h
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 09/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import <PAPreferences/PAPreferences.h>

@interface EDCTPreferences : PAPreferences

@property (assign, nonatomic) NSString *firstInstalled;

@property (assign, nonatomic) BOOL hasSeenTimetable;

@end
