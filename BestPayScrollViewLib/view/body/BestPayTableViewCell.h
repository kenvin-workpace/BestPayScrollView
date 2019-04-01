//
//  BestPayTableViewCell.h
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/8.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BestPayTableViewCell : UITableViewCell

@property (nonatomic,copy)NSArray *pictures;

@property (nonatomic,assign)NSInteger indexPic;

// tableview cell
+ (instancetype)initBestPayTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
