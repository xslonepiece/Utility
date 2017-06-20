//
//  ViewController.m
//  Utility
//
//  Created by xsl on 2017/5/16.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import "ViewController.h"

#import "GradientButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GradientButton *btn = [GradientButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 80);
    btn.center = self.view.center;
    [btn setTitle:@"hello world" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setGradientColors:@[[UIColor redColor],[UIColor greenColor]] forState:UIControlStateHighlighted];
    [btn setGradientColors:@[[UIColor redColor],[UIColor blueColor]] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnSelected:(GradientButton *)btn{
    btn.selected = !btn.selected;
}

@end
