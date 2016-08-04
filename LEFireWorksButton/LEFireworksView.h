//
//  LEFireworksView.h
//  LEFireWorksButton
//
//  Created by 陈记权 on 8/4/16.
//  Copyright © 2016 LeEco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEFireworksView : UIView

/**
 *  粒子图片
 */
@property (nonatomic, strong) UIImage *particleImage;

@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;

@end
