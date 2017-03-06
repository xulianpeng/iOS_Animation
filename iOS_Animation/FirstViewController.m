//
//  FirstViewController.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/3/6.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "FirstViewController.h"
#import "DropViewController.h"
#import "GiftEffectViewController.h"
#import "DazViewController.h"
#import "SprayViewController.h"
#import "SnowViewController.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *titles;
@end
static NSString *reuseIdentifier = @"reuserCell";

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"效果集合";
    [self _initTabelView];
    
}
- (void) _initTabelView{
    _titles = @[@"粒子掉落",@"直播礼物冒泡效果",@"烟花效果",@"喷射效果",@"雪花飘落"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.tableFooterView = [[UIView alloc] init];
    [tableView setExclusiveTouch:YES];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            [self.navigationController pushViewController:[[DropViewController alloc] init] animated:YES];
            break;
        }
        case 1:{
            [self.navigationController pushViewController:[[GiftEffectViewController alloc] init] animated:YES];
            break;
        }
        case 2:{
            [self.navigationController pushViewController:[[DazViewController alloc] init] animated:YES];
            break;
        }
        case 3:{
            [self.navigationController pushViewController:[[SprayViewController alloc] init] animated:YES];
            break;
        }
        case 4:{
            [self.navigationController pushViewController:[[SnowViewController alloc] init] animated:YES];
            break;
        }
            
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
