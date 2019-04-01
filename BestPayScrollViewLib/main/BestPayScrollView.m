//
//  BestPayScrollView.m
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/8.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "BestPayScrollView.h"
#import "BestPayTableViewCell.h"
#import "BestPayTableViewHeader.h"
#import "BestPayFooterView.h"

#define ROW_HEIGHT 130
#define HEIGHT_HEIGHT 113

@interface BestPayScrollView() <UITableViewDataSource,BestPayScrollViewDelegate>

@property (nonatomic,strong)UITableView *bodyView;
@property (nonatomic,strong)BestPayFooterView *footerView;
@property (nonatomic,strong)BestPayTableViewHeader *headerView;

@property (nonatomic,copy)NSArray *pictures;

@end

@implementation BestPayScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 准备子View
        [self init_views];
    }
    return self;
}

# pragma mark: 准备子View
- (void)init_views{
    // 准备view高度
    self.frame = UIScreen.mainScreen.bounds;
    // 准备 头部布局
    [self init_header_view];
    // 准备 底部布局
    [self init_footer_view];
    // 准备 躯干布局
    [self init_middle_view];
}

// 准备 头部布局
- (void)init_header_view{
    self.headerView = [BestPayTableViewHeader initBestPayHeaderView];
}

// 准备 底部布局
- (void)init_footer_view{
    self.footerView = [BestPayFooterView initBestPayFooterView];
    [self addSubview:self.footerView];
}

// 准备 躯干布局
- (void)init_middle_view{
    self.bodyView = [[UITableView alloc] init];
    self.bodyView.rowHeight = ROW_HEIGHT;
    self.bodyView.separatorStyle = UITableViewScrollPositionNone;
    self.bodyView.dataSource = self;
    [self addSubview:self.bodyView];
}


# pragma mark: 设置子View Frame
- (void)layoutSubviews{
    // 屏幕尺寸
    CGSize size = UIScreen.mainScreen.bounds.size;
    self.bodyView.frame = CGRectMake(0, 0, size.width, size.height - self.footerView.frame.size.height - self.footerMargin);
    // 添加画躯干Frame
    self.bodyView.tableHeaderView = self.headerView;
    // 头部Name显示
    if ([self.headerDelegate respondsToSelector:@selector(bestPayScrollView:headerName:)]) {
        self.headerView.headerName = [self.headerDelegate bestPayScrollView:self headerName:@"洪振"];
    }
    // 底部Frame
    CGFloat rectY = CGRectGetMaxY(self.bodyView.frame);
    self.footerView.frame = CGRectMake(0, rectY, size.width, self.footerView.bounds.size.height);
    // 为底部按钮添加点击事件
    self.footerView.delegate = self;
}

- (void)clickScan{
    if ([self.footerDelegate respondsToSelector:@selector(bestPayScrollView:clickScan:)]) {
        [self.footerDelegate bestPayScrollView:self clickScan:@"扫一扫"];
    }
}

- (void)clickQrcode{
    if ([self.footerDelegate respondsToSelector:@selector(bestPayScrollView:clickQrcode:)]) {
        [self.footerDelegate bestPayScrollView:self clickQrcode:@"收款码"];
    }
}

- (void)clickAmount{
    if ([self.footerDelegate respondsToSelector:@selector(bestPayScrollView:clickAmount:)]) {
        [self.footerDelegate bestPayScrollView:self clickAmount:@"付款码"];
    }
}

# pragma mark: 手势事件
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    // 当前位置
    CGPoint currentPoint = [touch locationInView:self];
    // 之前的位置
    CGPoint previousPoint = [touch previousLocationInView:self];
    // 移动偏移量
    CGFloat offsetY = currentPoint.y - previousPoint.y;
    // 屏幕移动的Y值
    CGFloat moveY = fabs(self.frame.origin.y);
    // 躯干高度
    CGFloat bodyHeight = self.bodyView.bounds.size.height;
    // 底部高度
    CGFloat footerHeight = self.footerView.bounds.size.height;
    // 在顶部的footer view里
    if (moveY >= bodyHeight && offsetY <0) {
        [self.footerView startAnimate:[self getMoveRate:currentPoint] isScale:YES];
        return;
    }else if (moveY >= bodyHeight && currentPoint.y<=footerHeight+bodyHeight && offsetY > 0){
        // 向下滑
        [self.footerView startAnimate:[self getMoveRate:currentPoint] isScale:NO];
        return;
    }
    // 下拉到最大高度，阻止滑动
    if (fabs(self.frame.origin.y) == 0 && offsetY > 0) {
        return;
    }
    // 开始移动
    self.transform = CGAffineTransformTranslate(self.transform, 0, offsetY);
}

- (CGFloat)getMoveRate:(CGPoint)point{
    CGFloat rate = (point.y - self.bodyView.bounds.size.height) /self.footerView.bounds.size.height;
    return rate;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 移动的Y值
    CGFloat moveY = self.frame.origin.y;
    // 中心Y点
    CGFloat centerY = self.frame.size.height * 0.5;
    // 判断中心Y点，以及自动滑动
    if ((fabs(moveY) > centerY) && moveY < moveY * 0.5) {
        // 在向上滑动
        [self updateOffsetY:-self.bodyView.bounds.size.height];
    }else{
        // 在向下滑动
        [self updateOffsetY:0];
    }
}

// 偏移的Y量
- (void)updateOffsetY:(CGFloat)offsetY{
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, offsetY);
    } completion:^(BOOL finished) {
        if (finished && offsetY == -self.bodyView.bounds.size.height) {
            [UIView animateWithDuration:0.3 animations:^{
                for (int i=100; i>=0; i--) {
                    [self.footerView startAnimate:i*0.01 isScale:YES];
                }
            }];
        }
    }];
}

# pragma mark: UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pictureCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestPayTableViewCell *cell = [BestPayTableViewCell initBestPayTableViewCell:tableView indexPath:indexPath];
    cell.indexPic = indexPath.row;
    return cell;
}


@end
