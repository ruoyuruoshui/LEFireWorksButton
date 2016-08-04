//
//  LEFireworksButton.m
//  LEFireWorksButton
//
//  Created by 陈记权 on 8/4/16.
//  Copyright © 2016 LeEco. All rights reserved.
//

#import "LEFireworksButton.h"
#import "LEFireworksView.h"

@interface LEFireworksButton ()

@property (nonatomic, strong) LEFireworksView *fireworksView;

@end

@implementation LEFireworksButton

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
    _fireworksView.frame = self.bounds;
}

- (void)_setup
{
    self.fireworksView = [[LEFireworksView alloc]init];
    self.fireworksView.frame = self.bounds;
    [self insertSubview:_fireworksView atIndex:0];
}

#pragma mark -
#pragma mark - Public Methods

- (void)animate
{
    [self.fireworksView animate];
}

- (void)popOutsideWithDuration:(NSTimeInterval)duration
{
    __weak __typeof(&* self)weakSelf = self;
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                                     __strong __typeof (&* self)strongSelf = weakSelf;
                                     [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0f animations:^{
                                         strongSelf.transform = CGAffineTransformMakeScale(1.5, 1.5);
                                     }];
                                     
                                     [UIView addKeyframeWithRelativeStartTime:1 / 3.0f relativeDuration:1 / 3.0f animations:^{
                                         strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                     }];
                                     
                                     [UIView addKeyframeWithRelativeStartTime:2 / 3.0f relativeDuration:1 / 3.0f animations:^{
                                         strongSelf.transform = CGAffineTransformIdentity;
                                     }];
                                     
                                 } completion:^(BOOL finished) {
                                     
                                 }];
}

- (void)popInsideWithDuration:(NSTimeInterval)duration
{
    __weak __typeof(&* self)weakSelf = self;
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                                     __strong __typeof (&* self)strongSelf = weakSelf;
                                     [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0f animations:^{
                                         strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                     }];
                                     
                                     [UIView addKeyframeWithRelativeStartTime:1 / 2.0f relativeDuration:1 / 2.0f animations:^{
                                         strongSelf.transform = CGAffineTransformIdentity;
                                     }];
                                 } completion:^(BOOL finished) {
                                     
                                 }];
}

#pragma mark -
#pragma mark - Properties

- (UIImage *)particleImage
{
    return self.fireworksView.particleImage;
}

- (void)setParticleImage:(UIImage *)particleImage
{
    self.fireworksView.particleImage = particleImage;
}

- (CGFloat)particleScale
{
    return self.fireworksView.particleScale;
}

- (void)setParticleScale:(CGFloat)particleScale
{
    self.fireworksView.particleScale = particleScale;
}

- (CGFloat)particleScaleRange
{
    return self.fireworksView.particleScaleRange;
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    self.fireworksView.particleScaleRange = particleScaleRange;
}


@end
