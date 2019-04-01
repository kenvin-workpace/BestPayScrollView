//
//  PicBundleUtil.m
//  BestPayScrollViewLib
//
//  Created by Kevin on 2019/3/31.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "PicBundleUtil.h"

@implementation PicBundleUtil

// 从bundle加载图片
+ (UIImage *)loadImgFromBundle:(NSString *)picname{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BestPayScrollViewLib.framework/pictures" ofType:@"bundle"];
    NSString *picturePath = [[NSBundle bundleWithPath:path] pathForResource:picname ofType:nil];
    return [UIImage imageWithContentsOfFile:picturePath];
}

+ (UIImage *)getImgFromBundle:(NSString *)picname row:(NSInteger)row{
    NSString *imgName = [NSString stringWithFormat:@"%@%ld.png",picname,(long)row % 3];
    return [self loadImgFromBundle:imgName];
}

@end
