//
//  BestPayFooterView.m
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/9.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "BestPayFooterView.h"
#import "PicBundleUtil.h"

#define PIC_MARGIN UIScreen.mainScreen.bounds.size.width / 4
#define FOOTER_PATH @"/BestPayScrollViewLib.framework/BestPayFooterView"

@interface BestPayFooterView()

@property (weak, nonatomic) IBOutlet UIView *viewScan;
@property (weak, nonatomic) IBOutlet UIButton *btnScanView;
@property (weak, nonatomic) IBOutlet UILabel *labelScanView;

@property (weak, nonatomic) IBOutlet UIView *viewQrcode;
@property (weak, nonatomic) IBOutlet UIButton *btnQrcodeView;
@property (weak, nonatomic) IBOutlet UILabel *labelQrcodeView;


@property (weak, nonatomic) IBOutlet UIView *viewAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnAmountView;
@property (weak, nonatomic) IBOutlet UILabel *labelAmountView;

@property (weak, nonatomic) IBOutlet UIButton *imgViewMsg;

@end

@implementation BestPayFooterView

+ (instancetype)initBestPayFooterView{
    return [[NSBundle mainBundle] loadNibNamed:FOOTER_PATH owner:nil options:nil].firstObject;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    // 显示图片
    [self init_view];
    
}

// 显示图片
- (void)init_view{
    // 扫一扫
    [self showPic:self.btnScanView picname:@"ic_scrollbar_scan.png"];
    [self.btnScanView addTarget:self action:@selector(clickScanView) forControlEvents:UIControlEventTouchUpInside];
    // 付款码
    [self showPic:self.btnQrcodeView picname:@"ic_scrollbar_qrcode.png"];
    [self.btnQrcodeView addTarget:self action:@selector(clickQrcodeView) forControlEvents:UIControlEventTouchUpInside];
    // 付款
    [self showPic:self.btnAmountView picname:@"ic_scrollbar_amount.png"];
    [self.btnAmountView addTarget:self action:@selector(clickAmountView) forControlEvents:UIControlEventTouchUpInside];
    // 消息
    [self showPic:self.imgViewMsg picname:@"msg_icon.png"];
}

- (void)clickScanView{
    if ([self.delegate respondsToSelector:@selector(clickScan)]) {
        [self.delegate clickScan];
    }
}

- (void)clickQrcodeView{
    if ([self.delegate respondsToSelector:@selector(clickQrcode)]) {
        [self.delegate clickQrcode];
    }
}

- (void)clickAmountView{
    if ([self.delegate respondsToSelector:@selector(clickAmount)]) {
        [self.delegate clickAmount];
    }
}

// 加载图片
- (void)showPic:(UIButton *)btn picname:(NSString *)picname{
    UIImage *img = [PicBundleUtil loadImgFromBundle:picname];
    [btn setImage:img forState:UIControlStateNormal];
}

- (void)startAnimate:(CGFloat)rate isScale:(BOOL)isScale{
    [self changeFrame:self.viewScan label:self.labelScanView rate:rate offsetX:0 isScale:isScale];
    [self changeFrame:self.viewQrcode label:self.labelQrcodeView rate:rate offsetX:2 isScale:isScale];
    [self changeFrame:self.viewAmount label:self.labelAmountView rate:rate offsetX:4 isScale:isScale];
}

- (void)changeFrame:(UIView*)uiview label:(UILabel *)label rate:(CGFloat)rate offsetX:(CGFloat)offset isScale:(BOOL)isScale{
    // 平移距离
    CGFloat translationX = -PIC_MARGIN * offset * (1-rate);
    // 已缩放到最小
    if (isScale && label.alpha <= 0) {
        label.alpha = 0;
        return;
    }
    // 消息图片
    if (isScale) {
        self.imgViewMsg.alpha = (1-rate);
        self.imgViewMsg.transform = CGAffineTransformMakeTranslation(0, -10*(1-rate));
    }else{
        self.imgViewMsg.alpha = (1-0.2-rate);
        self.imgViewMsg.transform = CGAffineTransformIdentity;
    }
    // 已缩放到最大
    if (!isScale && label.alpha >= 1) {
        label.alpha = 1;
        return;
    }
    // 透明度
    label.alpha = rate;
    if (!isScale && rate>0.8) {
        [UIView animateWithDuration:0.2 animations:^{
            uiview.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        }];
        return;
    }
    // 缩放、平移
    if (rate >=0.6) {
        uiview.transform = CGAffineTransformMake(rate, 0, 0, rate, translationX, 0);
    }
}

@end
