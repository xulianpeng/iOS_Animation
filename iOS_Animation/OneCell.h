//
//  OneCell.h
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/2.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneModel.h"
@interface OneCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UILabel *titleLabel3;
@property(nonatomic,strong)UIButton *detailBt;
@property(nonatomic,strong)UIButton *downBt;
@property(nonatomic,strong)OneModel *oneModel;
@end
