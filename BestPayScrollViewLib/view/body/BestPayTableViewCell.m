//
//  BestPayTableViewCell.m
//  BestPayScrollView
//
//  Created by Kevin on 2019/3/8.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "BestPayTableViewCell.h"
#import "PicBundleUtil.h"

#define CELL_PATH @"/BestPayScrollViewLib.framework/BestPayTableViewCell"

@interface BestPayTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation BestPayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

// tableview cell
+ (instancetype)initBestPayTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    // 重用ID
    static NSString *pictureid = @"picture_id";
    // 获取CELL
    BestPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pictureid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:CELL_PATH owner:nil options:nil].firstObject;
    }
    // 选中背景颜色为无
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setIndexPic:(NSInteger)indexPic{
    _indexPic = indexPic;
    // 更新显示图片    
    self.imgView.image = [PicBundleUtil getImgFromBundle:@"icon_wechat" row:_indexPic];
}


@end
