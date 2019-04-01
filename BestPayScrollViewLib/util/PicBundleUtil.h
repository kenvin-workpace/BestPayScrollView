//
//  PicBundleUtil.h
//  BestPayScrollViewLib
//
//  Created by Kevin on 2019/3/31.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PicBundleUtil : NSObject

// 从bundle加载图片
+ (UIImage *)loadImgFromBundle:(NSString *)picname;

// 从bundle加载图片，大于第3张，则使用之前的图片
+ (UIImage *)getImgFromBundle:(NSString *)picname row:(NSInteger)row;

@end

NS_ASSUME_NONNULL_END
