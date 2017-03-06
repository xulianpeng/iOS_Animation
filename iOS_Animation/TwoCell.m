//
//  TwoCell.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/2.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "TwoCell.h"
#import "Masonry.h"
@implementation TwoCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel2 = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel2];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(self.titleLabel2.mas_left).offset(-10);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(10);
        }];
        
        [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(self.titleLabel.mas_right).offset(10);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(10);
        }];
        
        

        
    }
    return self;
}
- (void)setTwoModel:(TwoModel *)twoModel{
    self.titleLabel.text = twoModel.title1;
    self.titleLabel2.text = twoModel.title2;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
