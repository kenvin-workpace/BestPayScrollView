//
//  BestPayFooterView.h
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/9.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestPayScrollViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface BestPayFooterView : UIView

+ (instancetype)initBestPayFooterView;

// 缩放动画
- (void)startAnimate:(CGFloat)rate isScale:(BOOL)isScale;

@property (nonatomic,weak) id<BestPayScrollViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
