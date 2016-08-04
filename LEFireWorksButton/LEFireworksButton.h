//
//  LEFireworksButton.h
//  LEFireWorksButton
//
//  Created by 陈记权 on 8/4/16.
//  Copyright © 2016 LeEco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEFireworksButton : UIButton

@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;
- (void)popOutsideWithDuration:(NSTimeInterval)duration;
- (void)popInsideWithDuration:(NSTimeInterval)duration;

@end
