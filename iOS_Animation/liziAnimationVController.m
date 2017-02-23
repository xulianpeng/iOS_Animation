//
//  liziAnimationVController.m
//  iOS_Animation
//
//  Created by lianpeng on 2017/2/22.
//  Copyright © 2017年 xulianpeng. All rights reserved.
//

#import "liziAnimationVController.h"

@interface liziAnimationVController ()

@end

@implementation liziAnimationVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation1];
    [self animation2];
    [self fireAnimation];
//    [self animation4];
}
//雪花动画
- (void)animation1 {
    
    //粒子发射器
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    //粒子发射的位置
    snowEmitter.emitterPosition = CGPointMake(100, 30);
    //发射源的大小
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width, 0.0);;
    //发射模式
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    //发射源的形状
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    //创建雪花粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名称
    snowflake.name = @"snow";
    //粒子参数的速度乘数因子。越大出现的越快
    snowflake.birthRate		= 1.0;
    //存活时间
    snowflake.lifetime		= 120.0;
    //粒子速度
    snowflake.velocity		= -10;				// falling down slowly
    //粒子速度范围
    snowflake.velocityRange = 10;
    //粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    //周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    //子旋转角度范围
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    //粒子图片
    snowflake.contents		= (id) [[UIImage imageNamed:@"DazFlake"] CGImage];
    //粒子颜色
    snowflake.color			= [[UIColor redColor] CGColor];
    
    //设置阴影
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // 将粒子添加到粒子发射器上
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}

//烟花动画
- (void)animation2 {
    // Cells spawn in the bottom, moving up
    
    //分为3种粒子，子弹粒子，爆炸粒子，散开粒子
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerLine;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 1.0;
    rocket.emissionRange	= 0.25 * M_PI;  // some variation in angle
    rocket.velocity			= 380;
    rocket.velocityRange	= 100;
    rocket.yAcceleration	= 75;
    rocket.lifetime			= 1.02;	// we cannot set the birthrate < 1.0 for the burst
    
    //小圆球图片
    rocket.contents			= (id) [[UIImage imageNamed:@"DazRing"] CGImage];
    rocket.scale			= 0.2;
    rocket.color			= [[UIColor redColor] CGColor];
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    rocket.spinRange		= M_PI;		// slow spin
    
    
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;        //速度为0
    burst.scale				= 2.5;      //大小
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;     //存在时间
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 400;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 度
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    //星星图片
    spark.contents			= (id) [[UIImage imageNamed:@"DazStarOutline"] CGImage];
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.25;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // 3种粒子组合，可以根据顺序，依次烟花弹－烟花弹粒子爆炸－爆炸散开粒子
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}


//🔥效果，有点屌哦
- (void)fireAnimation{
    CAEmitterLayer *fireEmitter = [CAEmitterLayer layer];
    fireEmitter.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height - 60);
    fireEmitter.emitterSize = CGSizeMake( 50, 0);
    fireEmitter.emitterShape = kCAEmitterLayerLine;
    fireEmitter.renderMode  = kCAEmitterLayerAdditive;
    //火焰
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    fire.birthRate   = 500;
    fire.emissionLongitude  = M_PI;
    fire.velocity   = -80;
    fire.velocityRange  = 30;
    fire.emissionRange  = 1.1;
    fire.yAcceleration  = -200;
    fire.scaleSpeed   = 0.3;
    fire.lifetime   = 1;
    fire.lifetimeRange  = 0.35;
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    
    fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    
    //烟雾
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
    [smoke setName:@"smoke"];
    
    smoke.birthRate   = 11;
    smoke.lifetime   = 4;
    smoke.velocity   = -40;
    smoke.velocityRange  = 20;
    smoke.emissionRange  = M_PI / 4;
    smoke.spinRange   = 6;
    smoke.yAcceleration  = -160;
    smoke.scale    = 0.1;
    smoke.alphaSpeed  = -0.12;
    smoke.scaleSpeed  = 0.7;
    
    smoke.contents   = (id) [[UIImage imageNamed:@"DazSmoke"] CGImage];;
    smoke.color = [[UIColor colorWithWhite:0.5 alpha:0.3]CGColor];
    
    fireEmitter.emitterCells = @[smoke,fire];
    [self.view.layer addSublayer:fireEmitter];
}

- (void)animation4{
    CAEmitterLayer *fireEmitter = [CAEmitterLayer layer];
    fireEmitter.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height - 60);
    fireEmitter.emitterSize = CGSizeMake( 50, 0);
    fireEmitter.emitterShape = kCAEmitterLayerLine;
    fireEmitter.renderMode  = kCAEmitterLayerAdditive;
    //火焰
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    fire.birthRate   = 500;
    fire.emissionLongitude  = M_PI;
    fire.velocity   = -80;
    fire.velocityRange  = 30;
    fire.emissionRange  = 1.1;
    fire.yAcceleration  = -200;
    fire.scaleSpeed   = 0.3;
    fire.lifetime   = 1;
    fire.lifetimeRange  = 0.35;
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    
    fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    //烟雾
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
    [smoke setName:@"smoke"];
    
    smoke.birthRate   = 11;
    smoke.lifetime   = 4;
    smoke.velocity   = -40;
    smoke.velocityRange  = 20;
    smoke.emissionRange  = M_PI / 4;
    smoke.spinRange   = 6;
    smoke.yAcceleration  = -160;
    smoke.scale    = 0.1;
    smoke.alphaSpeed  = -0.12;
    smoke.scaleSpeed  = 0.7;
    
    smoke.contents   = (id) [[UIImage imageNamed:@"DazSmoke"] CGImage];
    smoke.color = [[UIColor colorWithWhite:0.5 alpha:0.3]CGColor];
    
    fireEmitter.emitterCells = @[smoke,fire];
    [self.view.layer addSublayer:fireEmitter];
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
