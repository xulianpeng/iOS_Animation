//
//  OneCell.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/2.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "OneCell.h"
#import "Masonry.h"
@implementation OneCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel1 = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel1];
        [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(100);
        }];
        
        self.titleLabel2 = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel2];
        self.titleLabel3 = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel3];
        
        [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLabel1.mas_bottom).offset(10);
            make.height.mas_equalTo(30);
            make.right.mas_equalTo(self.titleLabel3.mas_left).offset(-10);
        }];
        
        
        [self.titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-self.contentView.frame.size.width/2);
//            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(30);
            make.left.mas_equalTo(self.titleLabel2.mas_right).offset(10);
        }];
        
        self.detailBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.detailBt];
        [self.detailBt mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(self.titleLabel3);
        }];
        self.detailBt.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setOneModel:(OneModel *)oneModel{
    
    self.titleLabel1.text = oneModel.title1;
    self.titleLabel2.text = oneModel.title2;
    self.titleLabel3.text = oneModel.title3;
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
