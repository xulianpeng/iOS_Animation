//
//  TwoCell.h
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/2.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoModel.h"
@interface TwoCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)TwoModel *twoModel;
@end
