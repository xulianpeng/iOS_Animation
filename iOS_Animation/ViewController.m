//
//  ViewController.m
//  iOS_Animation
//
//  Created by xulianpeng on 2016/12/1.
//  Copyright © 2016年 xulianpeng. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CoreAnimationVController.h"
#import "CATransitionViewController.h"
#import "liziAnimationVController.h"
#import "HighTableViewController.h"
#import "FirstViewController.h"
@interface ViewController ()
{
    UIView *parentView;
    UILabel *testLabel1;
    UIImageView *testImageView;
    UIActivityIndicatorView *testIndicatorView;
    
    UIButton *CATransitionButton;
    
    UIButton *liziButton;
    UIButton *liziButton1;
}
@end

@implementation ViewController


/**
 *  关于动画这块,一直想写一篇总结,准备了很长一段时间,最终产生了下面这篇总结,也算是自己的总结,当然也参照了网上各位大神的博客,但是知识只有经过自己的总结,才会产生火花的碰撞,才会真正转化为自己的东西,你们说呢?
 *  
 动画的分类: 1 UIView动画; 2 layer动画(核心类是Core Animation); 3 Senior动画(包括转场动画);
 以上基本把iOS的动画全部囊括了,也算对得起标题了.
 
 本篇主要介绍UIView动画,其包括 1UIViewAnimation;  2UIViewAnimationWithBlocks; 3UIImageView动画; 4UIActivityIndicatorView动画
 
 **/

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    parentView = [[UIView alloc]initWithFrame:CGRectMake(10, 250, 300, 200)];
    parentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:parentView];
    
    
    
    testLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(160, 0, 40, 30)];
    testLabel1.backgroundColor = [UIColor magentaColor];
    [parentView addSubview:testLabel1];
    
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.backgroundColor = [UIColor blueColor];
    [bt addTarget:self action:@selector(beginAnimationClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(30);
        make.top.mas_equalTo(64);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *resetBt = [UIButton buttonWithType:UIButtonTypeCustom];
    resetBt.backgroundColor = [UIColor redColor];
    [resetBt addTarget:self action:@selector(resetFrame:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetBt];
    [resetBt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bt.mas_right).offset(30);
        make.top.mas_equalTo(bt);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *imageAnimationBt = [UIButton buttonWithType:UIButtonTypeCustom];
    imageAnimationBt.backgroundColor = [UIColor redColor];
    [imageAnimationBt setTitle:@"ImageView动画" forState:UIControlStateNormal];
    [imageAnimationBt addTarget:self action:@selector(beginImageViewAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imageAnimationBt];
    [imageAnimationBt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(resetBt.mas_right).offset(30);
        make.top.mas_equalTo(resetBt);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *coreAnimationBt = [UIButton buttonWithType:UIButtonTypeCustom];
    coreAnimationBt.backgroundColor = [UIColor redColor];
    [coreAnimationBt setTitle:@"coreAnimation" forState:UIControlStateNormal];
    [coreAnimationBt addTarget:self action:@selector(jumpToCoreAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coreAnimationBt];
    [coreAnimationBt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imageAnimationBt.mas_right).offset(30);
        make.top.mas_equalTo(resetBt);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    
    CATransitionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:CATransitionButton];
    [CATransitionButton setTitle:@"CATransitionButton" forState:UIControlStateNormal];
    [CATransitionButton addTarget:self action:@selector(jumpToCATransitionAnimation:) forControlEvents:UIControlEventTouchUpInside];
    CATransitionButton.backgroundColor = [UIColor greenColor];
    [CATransitionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(parentView.mas_bottom).offset(10);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
        
        
    }];
#pragma mark - 粒子动画 入口按钮
    liziButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:liziButton];
    [liziButton setTitle:@"粒子动画入口" forState:UIControlStateNormal];
    liziButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [liziButton addTarget:self action:@selector(jumpToLiziAnimation:) forControlEvents:UIControlEventTouchUpInside];
    liziButton.backgroundColor = [UIColor greenColor];
    [liziButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(CATransitionButton.mas_top);
        make.left.mas_equalTo(CATransitionButton.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        
        
    }];
    liziButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:liziButton1];
    liziButton1.titleLabel.adjustsFontSizeToFitWidth = YES;
    [liziButton1 setTitle:@"粒子动画入口" forState:UIControlStateNormal];
    [liziButton1 addTarget:self action:@selector(jumpToLiziAnimation1:) forControlEvents:UIControlEventTouchUpInside];
    liziButton1.backgroundColor = [UIColor greenColor];
    [liziButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(liziButton.mas_bottom).offset(5);
        make.right.mas_equalTo(liziButton);
        make.width.mas_equalTo(liziButton);
        make.height.mas_equalTo(liziButton);
        
        
    }];
#pragma mark: 分类2- imageview的帧动画
    /*
     * 实际上个人感觉就是加载gif图.
     * uimageview 无法直接加载gif动图
     * 至于 本地加载 gif图和 网络加载gif图 可以参考 笔记
     */
    testImageView =   [[UIImageView alloc]init];
    [self.view addSubview:testImageView];
    /*************/
    
    NSMutableArray *imageArr = [NSMutableArray new];
    for (int i = 1;  i <= 13; i++) {
        
        UIImage *image = [[UIImage alloc]init];
        image = [UIImage imageNamed:[NSString stringWithFormat:@"nn-%d.tiff",i]];
        if(image != nil){
            [imageArr addObject:image];
        }
       
    }
    testImageView.animationImages = imageArr;
    testImageView.animationDuration = 5.0;
    testImageView.animationRepeatCount = 2;
    [testImageView startAnimating];
    /***********/
    testImageView.backgroundColor = [UIColor blueColor];
    [testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bt);
        make.top.mas_equalTo(bt.mas_bottom).offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(100);
        
    }];
#pragma mark: 分类3 UIActivityIndicatorView动画
    testIndicatorView = [[UIActivityIndicatorView alloc]init];
    [self.view addSubview:testIndicatorView];
    [testIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(testImageView.mas_right).offset(30);
        make.top.mas_equalTo(testImageView);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    testIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    testIndicatorView.backgroundColor = [UIColor redColor];//只是设置其背景色
    [testIndicatorView startAnimating];
    
#pragma mark 基本用法1:UIViewAnimation动画 一般舍弃
     
    /*
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:5];
    [UIView setAnimationWillStartSelector:@selector(stopLabel)];//动画开始前执行的方法
    [UIView setAnimationDidStopSelector:@selector(stopLabe2)];//动画结束后执行的方法
    // stopLabel,stopLabe2 都是瞬时执行完毕 不参与动画
    
//    [UIView setAnimationRepeatCount:1];//默认初始值为1,设为0或1是一样的效果,动画只会进行一次
    [UIView setAnimationRepeatAutoreverses:YES];//置为YES后,动画会按照设置的路线原路返回,否则是直线返回且速度很快.
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationsEnabled:YES];
    //最终希望达到的动画效果 y坐标变化 且有放大的效果.
    testLabel1.frame = CGRectMake(0, 100, 80, 60);
    
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:testLabel1 cache:YES];
//    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [UIView commitAnimations];
    //小结:显然这种动画方式 写法很费事 代码多 且无法实现放大的效果 因为其代码执行是顺序执行.目前只实现位移的效果 只改变x y 或同时改变xy.
    */
    
//    [self liziaNIMATION];
    
#pragma mark - 高级tableview的效果 动态添加cell
    
    UIButton *tableButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:tableButton];
    [tableButton setTitle:@"table动画入口" forState:UIControlStateNormal];
    [tableButton addTarget:self action:@selector(jumpToHighTable:) forControlEvents:UIControlEventTouchUpInside];
    tableButton.backgroundColor = [UIColor greenColor];
    [tableButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(CATransitionButton.mas_bottom).offset(5);
        make.left.mas_equalTo(CATransitionButton);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        
        
    }];
    
}
- (void)stopLabel
{
//    testLabel1.frame = CGRectMake(320 - 40, 500, 80, 60);
    testLabel1.backgroundColor = [UIColor redColor];
}
- (void)stopLabe2
{
//    testLabel1.frame = CGRectMake(320 - 40, 500, 80, 60);
    testLabel1.backgroundColor = [UIColor blueColor];
}
- (void)resetFrame:(UIButton *)bt{
    if (![parentView.subviews containsObject:testLabel1]) {
        [parentView addSubview:testLabel1];
    }
    testLabel1.alpha = 1.0;
    testLabel1.frame = CGRectMake(0, 0, 40, 30);
}
- (void)beginAnimationClick{
#pragma mark UIViewAnimationWithBlocks动画 基本用法2 3 4 5 6 7
    
#pragma mark 基本用法2: UIViewAnimation 最简单的Block动画
    /*
    [UIView animateWithDuration:2 animations:^{
        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
    }];
    */
#pragma mark 基本用法3: UIViewAnimation Block动画嵌套
    /*
    [UIView animateWithDuration:2 animations:^{
        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            testLabel1.backgroundColor = [UIColor redColor];
        }];
    }];
    */
#pragma mark 基本用法4: UIViewAnimation 实现动画重复
    //UIViewAnimationOptionRepeat //单一则只是重复动画的过程
    //UIViewAnimationOptionAutoreverse //单一 重复动画的反过程
    //以上两者合并 则实现动画重复
    /*
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseIn animations:^{
        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
    } completion:^(BOOL finished) {
        
    }];
    */
#pragma mark 基本用法5: UIViewAnimation transform动画
    
    /*
     *UIView有CGAffineTransform类型的属性transform,他是定义在二维空间上完成view的平移 旋转 缩放等效果的实现.
     */
   
    CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_2_PI);//旋转90度
    CGAffineTransform transform2 = CGAffineTransformMake(0.2, 0, 0, 1, 0, 0); //可以实现很多仿射变换的动画
    CGAffineTransform transform3 = CGAffineTransformMakeScale(1.5f, 1.5f);//放大1.5倍
    CGAffineTransform transform4 = CGAffineTransformMakeTranslation(15, 25);//平移 向右为x轴证方向 向下为y轴正方向
    
    CGAffineTransform transform5 = CGAffineTransformTranslate(transform1, 0, -160);//从字面理解是 变换1和 变换4的组合,期望的效果是 平移的过程中 旋转. 但是 后两个参数和平移的参数正好相反 ,第一个是 y轴 第二个是x轴 且向左为正 向右为负 这和transform4不一样.
    
    CGAffineTransform transform6 = CGAffineTransformScale(transform1, 2.0, 2.0);
    CGAffineTransform transform7 = CGAffineTransformConcat(transform1, transform3);//transform组合
    CGAffineTransform transform8 = CGAffineTransformInvert(transform1); //动画的逆过程
    CGAffineTransform transform9 = CGAffineTransformRotate(transform3, M_PI);
    CGAffineTransform transform10 = CGAffineTransformFromString(@"rotation");//这个暂时放弃 基本不用
    
    [UIView animateWithDuration:2 animations:^{
//        testLabel1.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
//        testLabel1.transform = CGAffineTransformMakeRotation(M_PI_2);
        testLabel1.transform = transform1;
        
    } completion:^(BOOL finished) {
//        [testLabel1 removeFromSuperview];
    }];
     
    
#pragma mark 基本用法6: UIViewAnimation 弹簧效果
    
    //有一个问题 transform效果 在重置后 再次启动时 失效
    /*
     
     //usingSpringWithDamping : 0.0 ~ 1.0 阻尼比例，数值越小「弹簧」的振动效果越明显
     //initialSpringVelocity : 初始的速度，数值越大一开始移动越快

    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        testLabel1.center = CGPointMake(150 - 5, testLabel1.center.y);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            testLabel1.transform = CGAffineTransformMakeScale(3.5f, 3.5f);
            testLabel1.alpha = 0.f;
        } completion:^(BOOL finished) {
//            [testLabel1 removeFromSuperview];
        }];
    }];
    */
     //小结:动画可以串联
     //作业: 如何实现输入框在输入错误的情况下 抖动
#pragma mark 基本用法7:UIViewAnimation 关键帧动画
    /*
    [UIView animateKeyframesWithDuration:5 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModePaced) animations:^{
     
     参数1: RelativeStartTime: 相对的开始时间
         参数2: relativeDuration:相对持续时间 
         options: UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse 和其他一样 两者同时使用 动画 正反过程 重复
         UIViewKeyframeAnimationOptionLayoutSubviews 没啥特别的
     
         
     
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.3 animations:^{ testLabel1.center = CGPointMake(320/2, 0);
            NSLog(@"关键帧11111");
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.2 animations:^{ testLabel1.frame = CGRectMake(100, 50, 80, 60);
            NSLog(@"关键帧22222");
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.3 animations:^{ testLabel1.frame = CGRectMake(100, 300, 40, 30);
            NSLog(@"关键帧3333");
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{ testLabel1.frame = CGRectMake(300, 300, 40, 30);
            NSLog(@"关键帧4444");
        }];
    } completion:^(BOOL finished) {
        NSLog(@"结束了");
    }];
*/
    //MARK:小结
    /*
     * 最后一个 StartTime + relativeDuration = 1, 这个必须的 ;
     * 下一个的 StartTime = 前一个的 StartTime + relativeDuration
     * frame的变化 的参考系是 其superView  即 parentView
     */
#pragma mark - 过渡动画
    //该动画 的作用对象是 container view
    //过渡动画 第一个参数 view是 拥有子视图的父试图 第二个参数duration 是options对应的动画类型 持续的时间,不是 animation block块里面的内容 也不是 completion block块里面的内容,options对应的动画类型由 第一个参数 view 展示 .
    // options:
    //UIViewAnimationOptionTransitionCurlUp 右下角往上翻页效果
    //UIViewAnimationOptionTransitionCurlDown 前者的逆过程
    //UIViewAnimationOptionTransitionFlipFromBottom 从底部往里翻转
    //UIViewAnimationOptionTransitionFlipFromTop 从顶部往里翻转
    //UIViewAnimationOptionTransitionFlipFromLeft 从左部往里翻转
    //UIViewAnimationOptionTransitionFlipFromRight 从右部往里翻转
    //UIViewAnimationOptionTransitionCrossDissolve 模拟渐变动画 如下 testLabel消失有渐变的过程
#pragma mark - 过渡动画 1
    /*
    [UIView transitionWithView:parentView duration:5.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [testLabel1 removeFromSuperview];
    } completion:^(BOOL finished) {

    }];
    */

#pragma mark - 过渡动画 2
    /*
    UIView *toView = [[UIView alloc]init];
    toView.backgroundColor = [UIColor redColor];
    [self.view addSubview:toView];
    [toView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(80);
        
    }];
    
    //效果是 fromView 消失   toView 显示
    //fromView toView拥有一个共同的 父view
    // CrossDissolve 渐变的过程
    [UIView transitionFromView:testImageView toView:toView duration:3.0 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        
    }];
    */


    
    
    
}
- (void)beginImageViewAnimation:(UIButton *)sender{
    
    [testImageView stopAnimating];
}
- (void)jumpToCoreAnimation:(UIButton *)sender{
    CoreAnimationVController *vc = [[CoreAnimationVController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)jumpToCATransitionAnimation:(UIButton *)sender{
#pragma mark - 在CATransition动画 加入 试图跳转
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 0.5;
    //设置运动type
    animation.type = @"cube";
    animation.subtype = kCATransitionFromLeft;//
//    animation.autoreverses = YES;
//    animation.fillMode = kCAFillModeForwards;
//    animation.repeatCount = 2;
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    /// 在CATransition动画 加入 试图跳转
    CATransitionViewController *vc = [[CATransitionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:@"111"];
}
- (void)fadeEvernote{
    
//    CollectionViewController *vc = [[CollectionViewController alloc]init];
    
//    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 粒子动画入口
- (void)jumpToLiziAnimation:(UIButton *)sender{
    liziAnimationVController *liziVC = [[liziAnimationVController alloc]init];
    [self.navigationController pushViewController:liziVC animated:YES];
}
- (void)jumpToLiziAnimation1:(UIButton *)sender{
    FirstViewController *liziVC = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:liziVC animated:YES];
}
- (void)jumpToHighTable:(UIButton *)sender{
    
    HighTableViewController *vc = [[HighTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
