//
//  EDCTCourses.m
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import "EDCTCourses.h"

@implementation EDCTCourses

- (instancetype)initWithResponseObject:(NSDictionary *)dictionary
{
    self.fullCode = [(NSArray *)dictionary[@"course"] objectAtIndex:0][@"full_code"];
    self.courseName = dictionary[@"name"];
    self.type = [NSString stringWithString:dictionary[@"type"]];      //The value for the key "type" is a NSTaggedPointerString. Use this method to make it a NSString.
    self.building = [(NSArray *)dictionary[@"location"] objectAtIndex:0][@"building"];
    self.campus = [(NSArray *)dictionary[@"location"] objectAtIndex:0][@"campus"];
    self.room = [(NSArray *)dictionary[@"location"] objectAtIndex:0][@"room"];
    self.dayVerbose = [NSString stringWithString:dictionary[@"day_verbose"] ];  //The same as "type".
    self.start = dictionary[@"start"];
    self.end = dictionary[@"end"];
    
    NSString *weekPatternString = dictionary[@"week_pattern"];
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i=6; i <= 16; i++)
    {
        NSNumber *isCourse;
        if ([[weekPatternString substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"0"]) {
            isCourse = [NSNumber numberWithBool:false];
        } else {
            isCourse = [NSNumber numberWithBool:true];
        }
        
        [tempArray insertObject:isCourse atIndex:(i-6)];
    }
    self.weekPattern = [NSArray arrayWithArray:tempArray];
    
    return self;
}

@end
