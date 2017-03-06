//
//  highTableViewController.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/2.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "HighTableViewController.h"
#import "OneCell.h"
#import "TwoCell.h"
#import "ThreeCell.h"
@interface HighTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *rootTableView;
    BOOL showDetailBool0;
    BOOL showDetailBool1;
    BOOL showDetailBool2;
    NSMutableArray *dataArr;
    
    NSMutableArray *oneDataArr;
    NSMutableArray *twoDataArr;
    NSMutableArray *threeDataArr;
}
@end

@implementation HighTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    rootTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:rootTableView];
    rootTableView.backgroundColor = [UIColor purpleColor];
    
    [rootTableView registerClass:[OneCell class] forCellReuseIdentifier:@"one"];
    [rootTableView registerClass:[TwoCell class] forCellReuseIdentifier:@"two"];
    
    rootTableView.delegate = self;
    rootTableView.dataSource = self;
    showDetailBool0 = NO;
    showDetailBool1 = NO;
    showDetailBool2 = NO;
    dataArr = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        
        OneModel *model = [[OneModel alloc]init];
        model.title1 =  [NSString stringWithFormat:@"标准模式%d",i];
        model.title2 =  [NSString stringWithFormat:@"剩余需要下载的数据%d",i];
        model.title3 =  @"查看内容";
        [dataArr addObject:model];
        
        
    }
    
    oneDataArr = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        
        TwoModel *model = [[TwoModel alloc]init];
        model.title1 =  [NSString stringWithFormat:@"狂野模式%d",i];
        model.title2 =  [NSString stringWithFormat:@"数据大小为%dM",i];
        [oneDataArr addObject:model];
    }
    
    twoDataArr = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        
        TwoModel *model = [[TwoModel alloc]init];
        model.title1 =  [NSString stringWithFormat:@"爱你模式%d",i];
        model.title2 =  [NSString stringWithFormat:@"擦擦数据大小为%dM",i];
        [twoDataArr addObject:model];
    }
    threeDataArr = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        
        TwoModel *model = [[TwoModel alloc]init];
        model.title1 =  [NSString stringWithFormat:@"擦擦模式%d",i];
        model.title2 =  [NSString stringWithFormat:@"擦擦擦擦数据大小为%dM",i];
        [threeDataArr addObject:model];
    }
    
    [rootTableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        if (showDetailBool0) {
            return 1 + oneDataArr.count;
        }else{
            return 1;
        }
    }else if(section == 1){
        if (showDetailBool1) {
            return 1+ twoDataArr.count;
        }else{
            return 1;
        }
    }else if(section == 2){
        if (showDetailBool2) {
            return 1 + threeDataArr.count;
        }else{
            return 1;
        }
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [UITableViewCell new];
    
    if(indexPath.section == 0){
        if (indexPath.row == 0) {
//             OneCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
            OneCell *cell0 = [[OneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"one"];
            cell0.oneModel = dataArr[0];
            cell0.detailBt.tag = 100 + indexPath.section;
            [cell0.detailBt addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
            cell = cell0;
        }else{
            
            TwoCell *cell00 = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
            cell00.twoModel = oneDataArr[indexPath.row - 1];
            cell = cell00;
        }
        
    }
    if(indexPath.section == 1){
        if (indexPath.row == 0) {
            
//            OneCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
            OneCell *cell1 = [[OneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"one"];
            cell1.oneModel = dataArr[1];
            cell1.detailBt.tag = 100 + indexPath.section;
            [cell1.detailBt addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
            cell = cell1;
        } else {
            
            TwoCell *cell00 = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
            cell00.twoModel = twoDataArr[indexPath.row - 1];
            cell = cell00;
            
        }
    }
    if(indexPath.section == 2){
        
        if (indexPath.row == 0) {
            
//            OneCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
            OneCell *cell2 = [[OneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"one"];
            cell2.oneModel = dataArr[2];
            cell2.detailBt.tag = 100 + indexPath.section;
            [cell2.detailBt addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
            cell = cell2;
        } else {
            TwoCell *cell00 = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
            cell00.twoModel = threeDataArr[indexPath.row - 1];
            cell = cell00;
        }
    }
    return cell;
}
- (void)showDetail:(UIButton*)sender{
    
    ////大坑点:
    //NSLog(@"===sender的tag值=%ld=====section===%ld按钮的点击状态的更新==%d,===%d",(long)sender.tag,sender.tag-100,sender.isSelected,sender.selected);
//    sender.selected = !sender.isSelected;
    // 展开第一区 ===sender的tag值=100=====section===0按钮的点击状态的更新==0,===0
    // 展开第二区===sender的tag值=101=====section===1按钮的点击状态的更新==0,===0
    //展开第三区  ===sender的tag值=102=====section===2按钮的点击状态的更新==0,===0
    //都展开后 关闭第一区 ===sender的tag值=100=====section===0按钮的点击状态的更新==0,===0,而不是我们想要的 点击的状态为 1 1,因为我们想要的效果是 点击后 其selected要改变 ,这样应该删除的额时候 你还是插入 就creash了 ,最后改为 依靠showDetailBool0来 存储sender的选择状态,新添加代码
    //showDetailBool0 = !showDetailBool0;  sender.selected = showDetailBool0;//
    
    NSInteger section = sender.tag - 100;
    NSMutableArray *rowsArray = [[NSMutableArray alloc]init];
    if (section == 0) {
        showDetailBool0 = !showDetailBool0;
        for (int i=0; i<oneDataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i+1 inSection:section];
            [rowsArray addObject:indexPath];
        }
        sender.selected = showDetailBool0;
    }else if(section == 1){
        
        showDetailBool1 = !showDetailBool1;
        
        for (int i=0; i<twoDataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i+1 inSection:section];
            [rowsArray addObject:indexPath];
        }
        sender.selected = showDetailBool1;
    }else if(section == 2){
        
        showDetailBool2 = !showDetailBool2;
        
        for (int i=0; i<threeDataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i+1 inSection:section];
            [rowsArray addObject:indexPath];
        }
        sender.selected = showDetailBool2;
    }
    
    
    
    [rootTableView beginUpdates];
    if (sender.selected) {
        [rootTableView insertRowsAtIndexPaths:rowsArray withRowAnimation:UITableViewRowAnimationAutomatic];
    }else {
        [rootTableView deleteRowsAtIndexPaths:rowsArray withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [rootTableView endUpdates];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
