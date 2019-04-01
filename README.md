# BestPayScrollView
模仿翼支付首页下/上拉View(可动态配置)，该项目是仅为个人练习，截图上的红色背景是宿主工程的，而且为了方便使用(DEMO)，一些资源都封死在了项目内。比如：图片资源

## 示例截图
<div align="center">
<img src="https://github.com/kenvin-workpace/BestPayScrollView/blob/master/screenshot/IMG_2230.png" height="25%" width="25%" >
<img src="https://github.com/kenvin-workpace/BestPayScrollView/blob/master/screenshot/IMG_2232.png" height="25%" width="25%" >
<img src="https://github.com/kenvin-workpace/BestPayScrollView/blob/master/screenshot/IMG_2231.png" height="25%" width="25%" >
</div>

## 导入头文件
`
#import <BestPayScrollViewLib/BestPayScrollView.h>
`
## 示例代码
```
BestPayScrollView *scrollview = [[BestPayScrollView alloc]init];
scrollview.pictureCount = 5;
scrollview.footerMargin = 44;
scrollview.headerDelegate = self;
scrollview.footerDelegate = self;
[self.view addSubview:scrollview];
```
## 属性设置
```
// View与底边TabBar的距离，默认为0
@property (nonatomic,assign)CGFloat footerMargin;
// 显示图片的数量。PS：个人练习项目，显示图片直接封死在库内
@property (nonatomic,assign)NSInteger pictureCount;
```
## BestPayScrollViewHeaderDelegate 代理设置
```
// 设置头部显示的Name名称
- (NSString *)bestPayScrollView:(BestPayScrollView *)scrollView headerName:(NSString *)headerName;
```
## BestPayScrollViewFooterDelegate 代理设置
```
// 点击了“扫一扫”图片
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickScan:(NSString *)scan;
// 点击了“收款码”图片
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickQrcode:(NSString *)qrcode;
// 点击了“付款码”图片
- (void)bestPayScrollView:(BestPayScrollView *)scrollView clickAmount:(NSString *)amount;
```
