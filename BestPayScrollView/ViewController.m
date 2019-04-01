//
//  ViewController.m
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/31.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "ViewController.h"
#import <BestPayScrollViewLib/BestPayScrollView.h>

@interface ViewController () <BestPayScrollViewHeaderDelegate,BestPayScrollViewFooterDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    BestPayScrollView *scrollview = [[BestPayScrollView alloc]init];
    scrollview.pictureCount = 5;
    scrollview.footerMargin = 0;
    scrollview.headerDelegate = self;
    scrollview.footerDelegate = self;
    [self.view addSubview:scrollview];
}

- (NSString *)bestPayScrollView:(BestPayScrollView *)scrollView headerName:(NSString *)headerName{
    return @"王洪振";
}

- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickScan:(NSString *)scan{
    NSLog(@"clickScan");
}

- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickQrcode:(NSString *)qrcode{
    NSLog(@"clickQrcode");
}

- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickAmount:(NSString *)acmount{
    NSLog(@"clickAmount");
}

@end
