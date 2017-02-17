//
//  CoreAnimationVController.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/2/10.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "CoreAnimationVController.h"
#import "Masonry.h"
@interface CoreAnimationVController ()<CAAnimationDelegate>
{
    UILabel *testLabel;
}
@end

@implementation CoreAnimationVController
/**
 * CoreAnimation简称CA,所有相关的类均以CA开头.
 * 所有的动画类都在QuartzCore库中,ios7以前使用时需导入#import <QuartzCore/QuartzCore.h>,ios7之后,系统已将其自动导入.
 * CA动画都是作用在layer上.
 * 主要包括 
 
 1:CAPropertyAnimation(CABasicAnimation,CAKeyframeAnimation),
 2:CAAnimationGroup,  
 3:CATransition
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CoreAnimation动画";
    
    testLabel = [[UILabel alloc]init];
    [self.view addSubview:testLabel];
    testLabel.text = @"什么情况啊";
    testLabel.adjustsFontSizeToFitWidth = YES;
    testLabel.backgroundColor = [UIColor redColor];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    
#pragma mark - 1:CABasicAnimation
//    [self positionAnimation];
//    [self transtionAnimation];
//    [self rotationAnimation];
//    [self scaleAnimation];
//    [self colorAnimation];
#pragma mark - 2:CAKeyframeAnimation
    [self keyFrameAnimationWithScale];
#pragma mark - 3:CAAnimationGroup
    
#pragma mark - 4:CATransition

    
}
- (void)positionAnimation{
    
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animationPosition.duration = 3.0;
        animationPosition.fromValue = @(self.view.center.y);
        animationPosition.toValue = @(0);
    animationPosition.removedOnCompletion = NO;
    animationPosition.delegate = self;
    //    animationPosition.autoreverses = YES;
        animationPosition.repeatCount = 2;
    //    animationPosition.repeatDuration = 4.0;
    animationPosition.fillMode = kCAFillModeForwards;
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [testLabel.layer addAnimation:animationPosition forKey:@"任意,就是起到区分的作用,也可以置为nil"];
}
- (void)transtionAnimation{
    
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animationPosition.duration = 3.0;
    animationPosition.fromValue = @(0);
    animationPosition.toValue = @(100);
    animationPosition.removedOnCompletion = NO;
    animationPosition.delegate = self;
        animationPosition.autoreverses = YES;
    animationPosition.repeatCount = 2;
    //    animationPosition.repeatDuration = 4.0;
    animationPosition.fillMode = kCAFillModeForwards;
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [testLabel.layer addAnimation:animationPosition forKey:@"任意,就是起到区分的作用"];
}
- (void)rotationAnimation{
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animationPosition.duration = 3.0;
    //    animationPosition.fromValue = @(self.view.center.y);
    //    animationPosition.toValue = @(0);
    animationPosition.fromValue = [NSNumber numberWithInt:0];
    animationPosition.toValue = [NSNumber numberWithFloat:M_PI_4];
    animationPosition.removedOnCompletion = NO;
    animationPosition.delegate = self;
    //    animationPosition.autoreverses = YES;
    //    animationPosition.repeatCount = 2;
    //    animationPosition.repeatDuration = 4.0;
    animationPosition.fillMode = kCAFillModeForwards;
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [testLabel.layer addAnimation:animationPosition forKey:@"transform.rotation.y"];
}
- (void)scaleAnimation{
//    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animationPosition.duration = 3.0;
    //    animationPosition.fromValue = @(self.view.center.y);
    //    animationPosition.toValue = @(0);
    animationPosition.fromValue = [NSNumber numberWithInt:0];
    animationPosition.toValue = [NSNumber numberWithFloat:2.0];
    animationPosition.removedOnCompletion = NO;
    animationPosition.delegate = self;
    //    animationPosition.autoreverses = YES;
        animationPosition.repeatCount = MAXFLOAT;
    //    animationPosition.repeatDuration = 4.0;
    animationPosition.fillMode = kCAFillModeForwards;
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [testLabel.layer addAnimation:animationPosition forKey:@"transform.scale"];

}
- (void)colorAnimation{
    //    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [testLabel.layer setShadowOffset:CGSizeMake(20,12)];
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    animationPosition.duration = 3.0;
    //    animationPosition.fromValue = @(self.view.center.y);
    //    animationPosition.toValue = @(0);
    animationPosition.fromValue = (id)[UIColor blueColor].CGColor;
    animationPosition.toValue = (id)[UIColor magentaColor].CGColor;
    animationPosition.removedOnCompletion = NO;
    animationPosition.delegate = self;
    //    animationPosition.autoreverses = YES;
    animationPosition.repeatCount = MAXFLOAT;
    //    animationPosition.repeatDuration = 4.0;
    animationPosition.fillMode = kCAFillModeForwards;
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [testLabel.layer addAnimation:animationPosition forKey:@"transform.scale"];
    
}
#pragma mark - 2:CAKeyframeAnimation
///关键帧动画 参考UIView的关键帧动画 可知 只需设置 相关的系列值 即可

//MARK:1 基于Scale的变换 从字面意思,设置几个 scale的值
- (void)keyFrameAnimationWithScale{
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    keyAnimation.duration = 1.0f;
//    keyAnimation.beginTime = CACurrentMediaTime() + 1.0;
    CATransform3D transform0 = CATransform3DMakeScale(1.0,1.0, 0);
    CATransform3D transform1 = CATransform3DMakeScale(2, 2, 0);
    CATransform3D transform2 = CATransform3DMakeScale(0.8, 0.8, 0);
    CATransform3D transform3 = CATransform3DMakeScale(0.0, 0.0, 0);
    CATransform3D transform4 = CATransform3DMakeScale(3.0, 3.0, 0);

    keyAnimation.values = @[[NSValue valueWithCATransform3D:transform0],
                            [NSValue valueWithCATransform3D:transform1],
                            [NSValue valueWithCATransform3D:transform2],
                            [NSValue valueWithCATransform3D:transform3],
                            [NSValue valueWithCATransform3D:transform4]];
//    keyAnimation.keyTimes = @[@0,@0.5,@1];
//    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.rotationMode = kCAAnimationCubic;
    ///kCAFillModeRemoved  kCAFillModeBackwards 最终恢复原状
    ///kCAFillModeForwards  kCAFillModeBoth  保持最后一个动画状态
    keyAnimation.fillMode = kCAFillModeForwards;
    [testLabel.layer addAnimation:keyAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
