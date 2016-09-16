//
//  EDCTMainViewController.m
//  EdCoursesTimetable
//
//  Created by Xu Donghui on 08/09/2016.
//  Copyright © 2016 Xu Donghui's. All rights reserved.
//

#import "EDCTMainViewController.h"
#import "EDCTCoursesManager.h"
#import <Masonry.h>

@interface EDCTMainViewController ()

@property (assign, nonatomic) NSUInteger  labelWidth;
@property (assign, nonatomic) NSUInteger  labelHeight;

@property (strong, nonatomic) UIView    * labelContainerView;
@property (strong, nonatomic) UILabel   * MonLabel;
@property (strong, nonatomic) UILabel   * TueLabel;
@property (strong, nonatomic) UILabel   * WedLabel;
@property (strong, nonatomic) UILabel   * ThuLabel;
@property (strong, nonatomic) UILabel   * FriLabel;

@property (strong, nonatomic) UILabel   * timeLabel9;
@property (strong, nonatomic) UILabel   * timeLabel10;
@property (strong, nonatomic) UILabel   * timeLabel11;
@property (strong, nonatomic) UILabel   * timeLabel12;
@property (strong, nonatomic) UILabel   * timeLabel13;
@property (strong, nonatomic) UILabel   * timeLabel14;
@property (strong, nonatomic) UILabel   * timeLabel15;
@property (strong, nonatomic) UILabel   * timeLabel16;
@property (strong, nonatomic) UILabel   * timeLabel17;

@end

@implementation EDCTMainViewController

extern NSString *kDidGetCoursesNotificationName;
extern NSString *kfailGetCoursesNotificationName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.labelWidth = self.view.frame.size.width/6;
    self.labelHeight = (self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height)/10;
    
    //Setup static labels
    self.MonLabel = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Mon";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.TueLabel = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Tue";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.WedLabel = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Wed";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.ThuLabel = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Thu";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.FriLabel = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Fri";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel9 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"9:00";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel10 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"10:00";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel11 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"11:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel12 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"12:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel13 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"13:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel14 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"14:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel15 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"15:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel16 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"16:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    self.timeLabel17 = ({
        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"17:10";
        label.font = [UIFont systemFontOfSize:17.0];
        label;
    });
    
    NSArray *timeLabels = [NSArray arrayWithObjects:self.timeLabel9, self.timeLabel10, self.timeLabel11, self.timeLabel12, self.timeLabel13, self.timeLabel14, self.timeLabel15, self.timeLabel16, self.timeLabel17, nil];
    NSArray *dayLabels = [NSArray arrayWithObjects:self.MonLabel, self.TueLabel, self.WedLabel, self.ThuLabel, self.FriLabel, nil];
    
    [self.view addSubview:self.MonLabel];
    [self.view addSubview:self.TueLabel];
    [self.view addSubview:self.WedLabel];
    [self.view addSubview:self.ThuLabel];
    [self.view addSubview:self.FriLabel];
    [self.view addSubview:self.timeLabel9];
    [self.view addSubview:self.timeLabel10];
    [self.view addSubview:self.timeLabel11];
    [self.view addSubview:self.timeLabel12];
    [self.view addSubview:self.timeLabel13];
    [self.view addSubview:self.timeLabel14];
    [self.view addSubview:self.timeLabel15];
    [self.view addSubview:self.timeLabel16];
    [self.view addSubview:self.timeLabel17];
    
    [self.MonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navigationController.navigationBar.frame.size.height);
        make.left.equalTo(self.view.mas_left).offset(self.labelWidth);
        make.width.equalTo(@(self.labelWidth));
        make.height.equalTo(@(self.labelHeight));
    }];
    
    for (int i = 1; i < 5; i++)
    {
        UILabel *label = dayLabels[i];
        UILabel *preLabel = dayLabels[i-1];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(self.navigationController.navigationBar.frame.size.height);
            make.left.equalTo(preLabel.mas_right);
            make.width.equalTo(@(self.labelWidth));
            make.height.equalTo(@(self.labelHeight));
        }];
    }
    
    [self.timeLabel9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navigationController.navigationBar.frame.size.height + self.labelHeight);
        make.left.equalTo(self.view);
        make.width.equalTo(@(self.labelWidth));
        make.height.equalTo(@(self.labelHeight));
    }];
    
    for (int i = 1; i < 9; i++)
    {
        UILabel *label = timeLabels[i];
        UILabel *preLabel = timeLabels[i-1];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preLabel.mas_bottom);
            make.left.equalTo(self.view);
            make.width.equalTo(@(self.labelWidth));
            make.height.equalTo(@(self.labelHeight));
        }];
    }
    
    if (![EDCTPreferences sharedInstance].hasSeenTimetable) {
        [self refresh];
    } else {
        NSArray *allCourses = [[EDCTCoursesManager sharedCourcesManager] unarchiverCourses];
        [self updateLabelsWithCourses:allCourses];
    }
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
