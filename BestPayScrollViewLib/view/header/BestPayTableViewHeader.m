//
//  BestPayTableViewHeader.m
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/9.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "BestPayTableViewHeader.h"
#import "BestPayScrollView.h"
#import "PicBundleUtil.h"

#define HEADER_PATH @"/BestPayScrollViewLib.framework/BestPayTableViewHeader"

@interface BestPayTableViewHeader()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *imgViewMsg;
@property (weak, nonatomic) IBOutlet UILabel *labelHeaderTime;

@end

@implementation BestPayTableViewHeader

+ (instancetype)initBestPayHeaderView{
    BestPayTableViewHeader *headerView = [[NSBundle mainBundle] loadNibNamed:HEADER_PATH owner:nil options:nil].firstObject;
    return headerView;
    
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.bounds = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 113);
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    // 消息按钮
    UIImage *img = [PicBundleUtil loadImgFromBundle:@"msg_icon.png"];
    [self.imgViewMsg setImage:img forState:UIControlStateNormal];
    // 日期显示
    self.dateLabel.text = [self getCurrentDate];
}

// 设置显示用户名
- (void)setHeaderName:(NSString *)headerName{
    _headerName = headerName;
    self.nameLabel.text = self.headerName;
}

- (NSString *)getCurrentDate{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *coms = [calendar components:units fromDate: [NSDate new]];
    // 获取星期几
    NSString *weekday = @"";
    switch (coms.weekday) {
        case 1:
            weekday = @"星期日";
            break;
        case 2:
            weekday = @"星期一";
            break;
        case 3:
            weekday = @"星期二";
            break;
        case 4:
            weekday = @"星期三";
            break;
        case 5:
            weekday = @"星期四";
            break;
        case 6:
            weekday = @"星期五";
            break;
        case 7:
            weekday = @"星期六";
            break;
        default:
            break;
    }
    // 拼接年、月、日、星期几
    return [NSString stringWithFormat:@"%ld年%ld月%ld日 %@",(long)coms.year,(long)coms.month,(long)coms.day,weekday];
}

@end
