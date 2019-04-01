//
//  BestPayScrollView.h
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/8.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BestPayScrollView;

/** 底部代理 **/
@protocol BestPayScrollViewFooterDelegate <NSObject>

@optional
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickScan:(NSString *)scan;
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickQrcode:(NSString *)qrcode;
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickAmount:(NSString *)amount;

@end

/** 头部代理 **/
@protocol BestPayScrollViewHeaderDelegate <NSObject>

@optional

- (NSString *)bestPayScrollView:(BestPayScrollView *)scrollView headerName:(NSString *)headerName;

@end

@interface BestPayScrollView : UIView

/** 属性 **/
@property (nonatomic,assign)CGFloat footerMargin;
@property (nonatomic,assign)NSInteger pictureCount;

/** 代理 **/
@property (nonatomic,weak)id<BestPayScrollViewHeaderDelegate> headerDelegate;
@property (nonatomic,weak)id<BestPayScrollViewFooterDelegate> footerDelegate;

@end

NS_ASSUME_NONNULL_END
