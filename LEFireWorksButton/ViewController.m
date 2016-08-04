//
//  ViewController.m
//  LEFireWorksButton
//
//  Created by 陈记权 on 8/4/16.
//  Copyright © 2016 LeEco. All rights reserved.
//

#import "ViewController.h"
#import "LEFireworksButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LEFireworksButton *likeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.likeButton setParticleImage:[UIImage imageNamed:@"sparkle"]];
    self.likeButton.particleScale = 0.05;
    self.likeButton.particleScaleRange = 0.02;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fireworksButtonAction:(id)sender
{
    LEFireworksButton *button = (LEFireworksButton *)sender;
    button.selected = ! button.selected;
    
    if (button.selected) {
        [button animate];
        [button popOutsideWithDuration:0.5];
    } else {
        [button popInsideWithDuration:0.5];
    }
}

@end
