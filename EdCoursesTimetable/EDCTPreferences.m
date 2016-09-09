//
//  EDCTPreferences.m
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 09/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import "EDCTPreferences.h"

@implementation EDCTPreferences

@dynamic firstInstalled;
@dynamic hasSeenTimetable;

- (id)init
{
    if (self = [super init])
    {
        NSString *version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        NSLog(@"Version: %@", version);
        if (!self.firstInstalled)
        {
            NSLog(@"App first launched");
            self.firstInstalled = version;
            self.hasSeenTimetable = NO;
        }
    }
    return self;
}

@end
