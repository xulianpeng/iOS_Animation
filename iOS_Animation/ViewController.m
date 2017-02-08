//
//  ViewController.m
//  iOS_Animation
//
//  Created by xulianpeng on 2016/12/1.
//  Copyright © 2016年 xulianpeng. All rights reserved.
//

#import "ViewController.h"
#import "Masonary.h"
@interface ViewController ()
{
    UIView *parentView;
    UILabel *testLabel1;
}
@end

@implementation ViewController


/**
 *  关于动画这块,一直想写一篇总结,准备了很长一段时间,最终产生了下面这篇总结,也算是自己的总结,当然也参照了网上各位大神的博客,但是知识只有经过自己的总结,才会产生火花的碰撞,才会真正转化为自己的东西,你们说呢?
 *  
 本篇的介绍顺序是 1 UIView动画; 2 layer动画(核心类是Core Animation); 3 Senior动画(包括转场动画);
 以上基本把iOS的动画全部囊括了,也算对得起标题了.
 
 **/

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    parentView = [[UIView alloc]initWithFrame:CGRectMake(10, 300, 300, 200)];
    parentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:parentView];
    
    
    testLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    testLabel1.backgroundColor = [UIColor magentaColor];
    [parentView addSubview:testLabel1];
    
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.
#pragma mark 基本用法1: 一般舍弃
     
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
    
    
#pragma mark 基本用法2: UIViewAnimation 最简单的Block动画
    
    [UIView animateWithDuration:2 animations:^{
        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
    }];

//    [UIView animateWithDuration:2 animations:^{
//        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
//    } completion:^(BOOL finished) {
//        
//        
//    }];
    
    
    
    //UIViewAnimationOptionRepeat //单一则只是重复动画的过程
    //UIViewAnimationOptionAutoreverse //单一 重复动画的反过程
    //以上两者合并 则实现动画重复
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseIn animations:^{
        testLabel1.frame = CGRectMake(300 - 80, 200 - 60, 80, 60) ;
    } completion:^(BOOL finished) {
        
    }];
    
    
    /*
    //动画 放大 后消失
    [UIView animateWithDuration:2 animations:^{
        testLabel1.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        testLabel1.alpha = 0.f;
    } completion:^(BOOL finished) {
        [testLabel1 removeFromSuperview];
    }];
     */
    //弹性动画
    //弹性效果的实现:必须有
    /*
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        testLabel1.center = CGPointMake(150 - 5, testLabel1.center.y);
//         testLabel1.frame = CGRectMake(0, 0, 80, 60) ;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            testLabel1.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
            testLabel1.alpha = 0.f;
        } completion:^(BOOL finished) {
            [testLabel1 removeFromSuperview];
        }];
    }];
    //小结:动画可以串联
    */
//作业: 如何实现输入框在输入错误的情况下 抖动
    
    
    /*
    [UIView animateKeyframesWithDuration:15
                                   delay:3
                                 options:(UIViewKeyframeAnimationOptionCalculationModeLinear)
                              animations:^{ // 参数1: RelativeStartTime: 相对的开始时间 参数2: relativeDuration:相对持续时间
                                  [UIView addKeyframeWithRelativeStartTime:0
                                                          relativeDuration:1/5
                                                                animations:^{
//                                      testLabel1.frame = CGRectMake(0, 200, 40, 30);
                                                                    testLabel1.backgroundColor = [UIColor redColor];
                                  }];
                                 
                                  [UIView addKeyframeWithRelativeStartTime:1/5
                                                          relativeDuration:1/5
                                                                animations:^{
//                                      testLabel1.frame = CGRectMake(50, 200, 40, 30);
                                                                    testLabel1.backgroundColor = [UIColor greenColor];
                                  }];
//                                  [UIView addKeyframeWithRelativeStartTime:2/5
//                                                          relativeDuration:1/5
//                                                                animations:^{
////                                      testLabel1.frame = CGRectMake(50, 0, 40, 30);
//                                                                    testLabel1.backgroundColor = [UIColor grayColor];
//                                  }];
//                                  [UIView addKeyframeWithRelativeStartTime:3/5
//                                                          relativeDuration:1/5
//                                                                animations:^{
////                                      testLabel1.frame = CGRectMake(100, 0, 40, 30);
//                                                                    testLabel1.backgroundColor = [UIColor yellowColor];
//                                  }];
//                                  [UIView addKeyframeWithRelativeStartTime:4/5
//                                                          relativeDuration:1/5
//                                                                animations:^{
////                                      testLabel1.frame = CGRectMake(100, 200, 40, 30);
//                                                                    testLabel1.backgroundColor = [UIColor darkGrayColor];
//                                  }];
                                  
                                  

                              } completion:^(BOOL finished) { NSLog(@"结束了");
                              }];
    */

    /*
    [UIView animateKeyframesWithDuration:5
                                   delay:0.0
                                 options:(UIViewKeyframeAnimationOptionAllowUserInteraction)
                              animations:^{ // 参数1: RelativeStartTime: 相对的开始时间 参数2: relativeDuration:相对持续时间
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:1/2
                                                                animations:^{
                                                                    //                                      testLabel1.frame = CGRectMake(0, 200, 40, 30);
//                                                                    testLabel1.backgroundColor = [UIColor redColor];
                                                                    testLabel1.center = CGPointMake(80, 10);
//                                                            testLabel1.center.x += 80.0;
//                                                            testLabel1.center.y -= 10.0;
                                                                }];
                                  
                                  
                                  [UIView addKeyframeWithRelativeStartTime:1/2
                                                          relativeDuration:1/2
                                                                animations:^{
                                                                    //                                      testLabel1.frame = CGRectMake(50, 200, 40, 30);
//                                                                    testLabel1.backgroundColor = [UIColor greenColor];
                                                                    testLabel1.center = CGPointMake(80, 80);
                                                                }];
     
     
     
                                  
                            } completion:^(BOOL finished) {
                                  NSLog(@"结束了");
                              }];
    
    
    //上面这个动画本来想实现画线的效果 但是没有实现
    */
    
    /*
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        

        
    } completion:^(BOOL finished) {
        
    }];
    */
    
    
    
    /*
     * 效果:  testLabel 逐渐放大 然后逐渐透明 最终移除
     */
    /*
    [UIView animateWithDuration:1.25 animations:^{
        CGAffineTransform newTransform = CGAffineTransformMakeScale(1.8, 1.8);
        [testLabel1 setTransform:newTransform];
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.2 animations:^{
                             [testLabel1 setAlpha:0];
                             
                         } completion:^(BOOL finished){
                                 [testLabel1 removeFromSuperview];
                         }];
                     }];
    */
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
