//
//  EDCTCoursesManager.m
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import "EDCTCoursesManager.h"
#import <AFNetworking.h>

static NSString *pathUrl = @"https://browser.ted.is.ed.ac.uk/generate?courses[]=CIVE09026_SV1_SEM1&courses[]=CIVE09032_SV1_SEM2&courses[]=CIVE09031_SV1_SEM2&courses[]=CIVE09030_SV1_SEM1&courses[]=CIVE09029_SV1_SEM2&courses[]=CIVE09028_SV1_SEM2&courses[]=CIVE09027_SV1_SEM2&courses[]=CIVE09016_SV1_SEM1&courses[]=CIVE09014_SV1_SEM1&courses[]=CIVE09015_SV1_SEM1&courses[]=CIVE09023_SV1_SEM2&courses[]=INFR09021_SV1_SEM1&show-close=1&show-close=1&period=SEM1&format=json";

NSString *kDidGetCoursesNotificationName = @"didGetCourses";
NSString *kfailGetCoursesNotificationName = @"failGetCourses";

@implementation EDCTCoursesManager

+ (instancetype)sharedCourcesManager
{
    static EDCTCoursesManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[EDCTCoursesManager alloc] init];
    });
    return _manager;
}

- (void)retriveCourses
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    [manager POST:pathUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@",responseObject);
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (NSDictionary *resultDic in responseObject)
        {
            EDCTCourses *course = [[EDCTCourses alloc] initWithResponseObject:resultDic];
            [tempArray addObject:course];
        }
        
        self.myCourses = [[NSArray alloc] initWithArray:tempArray];
        
        [self postDidGetCoursesNotification];
    } failure:^(NSURLSessionTask *task, NSError *error) {
        NSLog(@"Error: %@",error);
        
        [self postFailGetCoursesNotification];
    }];
}

- (void)postDidGetCoursesNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidGetCoursesNotificationName object:nil];
}

- (void)postFailGetCoursesNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kfailGetCoursesNotificationName object:nil];
}

@end
