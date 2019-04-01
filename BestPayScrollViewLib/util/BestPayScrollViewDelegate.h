//
//  BestPayScrollViewDelegate.h
//  SDK-BP-SCROLLVIEW
//
//  Created by Kevin on 2019/3/30.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BestPayScrollViewDelegate <NSObject>

- (void)clickScan;
- (void)clickQrcode;
- (void)clickAmount;

@end

NS_ASSUME_NONNULL_END
