//
//  EDCTMainViewController.m
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import "EDCTMainViewController.h"
#import "EDCTCoursesManager.h"

@interface EDCTMainViewController ()

@end

@implementation EDCTMainViewController

extern NSString *kDidGetCoursesNotificationName;
extern NSString *kfailGetCoursesNotificationName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![EDCTPreferences sharedInstance].hasSeenTimetable) {
        [self refresh];
    } else {
        NSArray *allCourses = [[EDCTCoursesManager sharedCourcesManager] unarchiverCourses];
        [self updateLabelsWithCourses:allCourses];
    }
    
    [self refresh];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTimeTable) name:kDidGetCoursesNotificationName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(failGetCourses) name:kfailGetCoursesNotificationName object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshCourses:(id)sender
{
    [self refresh];
}

- (void)updateTimeTable
{
    NSLog(@"Did update courses");
    
    [[EDCTCoursesManager sharedCourcesManager] saveCourses:[EDCTCoursesManager sharedCourcesManager].myCourses];
    
    [self updateLabelsWithCourses:[EDCTCoursesManager sharedCourcesManager].myCourses];
}

- (void)failGetCourses
{
    
}

- (void)refresh
{
    [[EDCTCoursesManager sharedCourcesManager] retriveCourses];
}

- (void)updateLabelsWithCourses:(NSArray *)allCourses
{
    //TODO:Update course labels according to courses data
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
