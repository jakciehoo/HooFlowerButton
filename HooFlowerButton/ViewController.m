//
//  ViewController.m
//  HooFlowerButton
//
//  Created by hujianghua on 11/17/15.
//  Copyright © 2015 hujianghua. All rights reserved.
//

#import "ViewController.h"
#import "HooFlowerButton.h"
#import "UIView+AutoLayout.h"

@interface ViewController ()<HooFlowerButtonDelegate>

@property (nonatomic, weak) HooFlowerButton *flowerButton;

@property (nonatomic , strong) NSDateFormatter *dateFormatter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HooFlowerButton *flowerButton = [[HooFlowerButton alloc] initFlowerButtonWithView:self.view showInView:self.view];
    flowerButton.delegate = self;
    [self.view addSubview:flowerButton];
    //_flowerButton = centerButton;
    [flowerButton autoCenterInSuperview];
    [flowerButton autoSetDimensionsToSize:CGSizeMake(90, 90)];
    flowerButton.layer.cornerRadius = 45;
    flowerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    flowerButton.layer.borderWidth = 2.0;
    flowerButton.titleLabel.font = [UIFont systemFontOfSize:30];
    flowerButton.showsTouchWhenHighlighted = YES;
    flowerButton.backgroundColor = [UIColor lightGrayColor];
    //显示月
    UILabel *monthLabel = [[UILabel alloc] init];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    monthLabel.textColor = [UIColor whiteColor];
    monthLabel.font = [UIFont systemFontOfSize:12];
    [flowerButton addSubview:monthLabel];
    [monthLabel autoSetDimension:ALDimensionHeight toSize:15];
    [monthLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) excludingEdge:ALEdgeBottom];
    //显示当天
    UILabel *dayLabel = [[UILabel alloc] init];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.font = [UIFont systemFontOfSize:30];
    [flowerButton addSubview:dayLabel];
    [dayLabel autoSetDimension:ALDimensionHeight toSize:30];
    [dayLabel autoCenterInSuperview];
    
    NSString *monthStr = [self getMonthOfDateAndConvertToString:[NSDate date]];
    NSString *dayStr = [self getDayOfDateAndConvertToString:[NSDate date]];
    monthLabel.text = monthStr;
    dayLabel.text = dayStr;
    
    
}

//获取当前月份
- (NSString *)getMonthOfDateAndConvertToString:(NSDate *)date
{
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"M月"];
    NSString *strDate = [self.dateFormatter stringFromDate:date];
    return strDate;
}
//获取当天日期
- (NSString *)getDayOfDateAndConvertToString:(NSDate *)date
{
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"d"];
    NSString *strDate = [self.dateFormatter stringFromDate:date];
    return strDate;
}

//弹出字按钮的个数
- (NSInteger)flowerButtonNumberOfItems:(HooFlowerButton *)flowerButton
{
    return 4;
}

//设置字按钮的图片
//大小建议为 30 * 30
- (UIImage *)flowerButton:(HooFlowerButton *)flowerButton imageForItemAtIndex:(NSInteger)index
{
    NSString *imageName = [NSString stringWithFormat:@"fbi_flat_%ld",index+1];
    return  [UIImage imageNamed:imageName];
}
//设置字按钮的标题
- (NSString *)flowerButton:(HooFlowerButton *)flowerButton titleForItemAtIndex:(NSInteger)index
{
    NSArray *titleArr = @[@"分享",@"编辑",@"下一张",@"返回"];
    
    return titleArr[index];
}
//选种子按钮触发事件
- (void)flowerButton:(HooFlowerButton*)flowerButton
       didSelectItem:(HooFlowerItem*)item
{
    NSLog(@"sub flowerButton %ld Click",(long)item.index);
}

@end
