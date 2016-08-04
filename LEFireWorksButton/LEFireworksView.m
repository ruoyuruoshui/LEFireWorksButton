//
//  LEFireworksView.m
//  LEFireWorksButton
//
//  Created by 陈记权 on 8/4/16.
//  Copyright © 2016 LeEco. All rights reserved.
//

#import "LEFireworksView.h"

@interface LEFireworksView ()

@property (nonatomic, strong) NSArray *emitterCells;
@property (nonatomic, strong) CAEmitterLayer *chargeLayer;
@property (nonatomic, strong) CAEmitterLayer *explosionLayer;

@end

@implementation LEFireworksView

#pragma mark -
#pragma mark - Life About

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.chargeLayer.emitterPosition = center;
    self.explosionLayer.emitterPosition = center;
}

- (void)_setup
{
    self.clipsToBounds = NO;
    self.userInteractionEnabled = NO;
    
    CAEmitterCell *chargeCell = [CAEmitterCell emitterCell];
    chargeCell.name = @"charge";
    chargeCell.alphaRange = 0.20f;
    chargeCell.alphaSpeed = -1.0f;
    chargeCell.lifetime = 0.3f;
    chargeCell.lifetimeRange = 0.1f;
    chargeCell.birthRate = 0.0f;
    chargeCell.velocity = -40.0f;
    chargeCell.velocityRange = 0.0f;
    
    self.chargeLayer = [CAEmitterLayer layer];
    _chargeLayer.name = @"emitterLayer";
    _chargeLayer.emitterShape = kCAEmitterLayerCircle;
    _chargeLayer.emitterMode = kCAEmitterLayerOutline;
    _chargeLayer.emitterSize = CGSizeMake(25, 0);
    _chargeLayer.renderMode = kCAEmitterLayerOldestFirst;
    _chargeLayer.masksToBounds = NO;
    _chargeLayer.seed = [[NSDate date]timeIntervalSinceNow] * 100;
    _chargeLayer.emitterCells = @[chargeCell];
    [self.layer addSublayer:_chargeLayer];
    
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];
    explosionCell.name = @"explosion";
    explosionCell.alphaSpeed = 0.2f;
    explosionCell.alphaSpeed = -1.0f;
    explosionCell.lifetime = 0.7f;
    explosionCell.lifetimeRange = 0.1f;
    explosionCell.birthRate = 0.0f;
    explosionCell.velocity = 40.0f;
    explosionCell.velocityRange = 10.0f;
    
    self.explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"explosionLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerCircle;
    _explosionLayer.emitterMode = kCAEmitterLayerOutline;
    _explosionLayer.emitterSize = CGSizeMake(25.0f, 0);
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
    _explosionLayer.masksToBounds = NO;
    _explosionLayer.seed = [[NSDate date]timeIntervalSinceNow] * 100;
    _explosionLayer.emitterCells = @[explosionCell];
    [self.layer  addSublayer:_explosionLayer];
    
    self.emitterCells = @[chargeCell, explosionCell];
}

- (void)animate
{
    self.chargeLayer.beginTime = CACurrentMediaTime();
    [self.chargeLayer setValue:@100 forKeyPath:@"emitterCells.charge.birthRate"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.chargeLayer setValue:@0 forKeyPath:@"emitterCells.charge.birthRate"];
        [self explode];
    });
}

- (void)explode
{
    self.explosionLayer.beginTime = CACurrentMediaTime();
    [self.explosionLayer setValue:@600 forKeyPath:@"emitterCells.explosion.birthRate"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stop];
    });
}

- (void)stop
{
    [self.chargeLayer setValue:@0 forKeyPath:@"emitterCells.charge.birthRate"];
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];
}

#pragma mark - 
#pragma mark - Properties

- (void)setParticleImage:(UIImage *)particleImage
{
    _particleImage = particleImage;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.contents = (id)[particleImage CGImage];
    }
}

- (void)setParticleScale:(CGFloat)particleScale
{
    _particleScale = particleScale;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.scale = particleScale;
    }
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange
{
    _particleScaleRange = particleScaleRange;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.scaleRange = particleScaleRange;
    }
}

@end
