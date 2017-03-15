//
//  SecondViewController.m
//  Json
//
//  Created by 韩森 on 16/9/30.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "SecondViewController.h"
#import "CFRunLoopTool.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"主标题";
    NSLog(@"");
    [CFRunLoopTool addTask:^{
        
        
    }];
    
//    self.navigationItem.prompt = @"副标题";
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
    
//    UISlider * slider = [[UISlider alloc]init];
//    self.navigationItem.titleView = slider;
//    slider.frame = self.navigationController.navigationBar.bounds;
//    slider.backgroundColor = [UIColor greenColor];
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
