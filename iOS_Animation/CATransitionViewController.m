//
//  CATransitionViewController.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/2/20.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "CATransitionViewController.h"
#define DURATION 0.7f
#define IMAGE1 @"01.jpg"
#define IMAGE2 @"02.jpg"
@interface CATransitionViewController ()
@property (nonatomic, assign) int subtype;
@end

@implementation CATransitionViewController
typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self  changeBackgroundColor];
    [self addBgImageWithImageName:IMAGE1];
    _subtype = 0;
    [self creatBt];
}
- (void)creatBt{
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"Fade淡入淡出",@"Push推挤",@"Reveal揭开",@"MoveIn覆盖",@"Cube立方体",@"SuckEffect吮吸",@"OglFlip翻转",@"RippleEffect波纹",@"PageCurl翻页",@"PageUnCurl反翻页",@"CameraIrisHollowOpen开镜头",@"CameraIrisHollowClose关镜头",@"CurlDown下翻页",@"CurlUp上翻页",@"FlipFromLeft左翻转",@"FlipFromRight右翻转", nil];
    for (int i = 0; i < titleArr.count/2 ; i++) {
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(10, 80 + 45 * i, 120, 40);
        bt.backgroundColor = [UIColor greenColor];
        [bt setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:bt];
        bt.layer.cornerRadius = 5;
        bt.layer.borderColor = [UIColor yellowColor].CGColor;
        bt.layer.borderWidth = 2;
        bt.titleLabel.adjustsFontSizeToFitWidth = YES;
        bt.tag = i;
        [bt addTarget:self action:@selector(beginTransitionAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }

    for (int i = 0; i < titleArr.count/2 ; i++) {
        
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(10+ 120 + 30, 80 + 45 * i, 150, 40);
        bt.backgroundColor = [UIColor greenColor];
        [bt setTitle:titleArr[i+8] forState:UIControlStateNormal];
        [self.view addSubview:bt];
        bt.layer.cornerRadius = 5;
        bt.layer.borderColor = [UIColor yellowColor].CGColor;
        bt.layer.borderWidth = 2;
        bt.titleLabel.adjustsFontSizeToFitWidth = YES;
        bt.tag = i+8;
        [bt addTarget:self action:@selector(beginTransitionAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)changeBackgroundColor{
    
    //修改视图的背景色
    self.view.backgroundColor = [UIColor greenColor];
    CATransition *animation = [CATransition animation];
    animation.duration = 3; /* 这里可设置的参数有：kCATransitionFade、kCATransitionPush、kCATransitionReveal、kCATransitionMoveIn、 "cube"、"suckEffect"、"oglFlip"、"rippleEffect"、"pageCurl"、"pageUnCurl"、"cameraIrisHollowOpen"、 "cameraIrisHollowClose"，这些都是动画类型 */
    
//    animation.type = @"cube"; // 动画执行的方向，kCATransitionFromRight、kCATransitionFromLeft、kCATransitionFromTop、kCATransitionFromBottom animation.subtype = kCATransitionFromRight;
    animation.type = @"kCATransitionFromRight";
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [self.view.layer addAnimation:animation forKey:nil]; //也可以写这里
    // _someView.backgroundColor = [UIColor greenColor];
}
- (void)beginTransitionAnimation:(UIButton *)sender{
    
    AnimationType animationType = sender.tag + 1;
    NSLog(@"=====%lu", (unsigned long)animationType);
    
    NSString *subtypeString;
    
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    _subtype += 1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }

    static int i = 0;
    if (i == 0) {
        [self addBgImageWithImageName:IMAGE1];
        i = 1;
    }
    else
    {
        [self addBgImageWithImageName:IMAGE2];
        i = 0;
    }
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 2;
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

#pragma 给View添加背景图
-(void)addBgImageWithImageName:(NSString *) imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
