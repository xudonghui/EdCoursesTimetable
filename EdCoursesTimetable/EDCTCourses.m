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
    self.dayVerbose = [NSString stringWithString:dictionary[@"day_verbose"]];  //The same as "type".
    self.start = [NSNumber numberWithInt:(int)dictionary[@"start"]/2];
    self.end = [NSNumber numberWithInt:((int)dictionary[@"end"]-1)/2];
    
    if ([self.dayVerbose isEqualToString:@"Monday"]) {
        self.dayInt = [NSNumber numberWithInt:1];
    } else if ([self.dayVerbose isEqualToString:@"Tuesday"]) {
        self.dayInt = [NSNumber numberWithInt:2];
    } else if ([self.dayVerbose isEqualToString:@"Wednesday"]) {
        self.dayInt = [NSNumber numberWithInt:3];
    } else if ([self.dayVerbose isEqualToString:@"Thursday"]) {
        self.dayInt = [NSNumber numberWithInt:4];
    } else if ([self.dayVerbose isEqualToString:@"Friday"]) {
        self.dayInt = [NSNumber numberWithInt:5];
    }
    
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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.fullCode = [aDecoder decodeObjectForKey:@"fullCode"];
        self.courseName = [aDecoder decodeObjectForKey:@"name"];
        self.building = [aDecoder decodeObjectForKey:@"building"];
        self.campus = [aDecoder decodeObjectForKey:@"campus"];
        self.room = [aDecoder decodeObjectForKey:@"room"];
        self.dayVerbose = [aDecoder decodeObjectForKey:@"dayVerbose"];
        self.dayInt = [aDecoder decodeObjectForKey:@"dayInt"];
        self.start = [aDecoder decodeObjectForKey:@"start"];
        self.end = [aDecoder decodeObjectForKey:@"end"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.fullCode forKey:@"fullCode"];
    [aCoder encodeObject:self.courseName forKey:@"name"];
    [aCoder encodeObject:self.building forKey:@"building"];
    [aCoder encodeObject:self.campus forKey:@"campus"];
    [aCoder encodeObject:self.room forKey:@"room"];
    [aCoder encodeObject:self.dayVerbose forKey:@"dayVerbose"];
    [aCoder encodeObject:self.dayInt forKey:@"dayInt"];
    [aCoder encodeObject:self.start forKey:@"start"];
    [aCoder encodeObject:self.end forKey:@"end"];
}

@end
