//
//  ViewController.m
//  Json
//
//  Created by 韩森 on 16/9/29.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"获取文件路径");
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"scource"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    //格式化成json数据
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableContainers error:nil];
    
    NSString * s = [[NSString alloc]initWithData:jdata encoding:NSUTF8StringEncoding];
    
    NSLog(@" %@",s);
    
    
//     NSDictionary *dic = [self sstringWith:s];
    NSLog(@"source____%@",jsonObject);

    
 }


-(NSDictionary*)sstringWith:(NSString *)string
{
    NSString *strUrl = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@":{" withString:@"\":{"];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@":[" withString:@"\":["];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"{" withString:@"{\""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"," withString:@",\""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@":'" withString:@"\":'"];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"\"\"" withString:@"\""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"\"{" withString:@"{"];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"\\" withString:@"\\/"];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"'}" withString:@"\"}"];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@":\",\"" withString:@":\"\",\""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@":\"}" withString:@":\"\"}"];
    
    NSString * requestTmp =[NSString stringWithString:strUrl];
    NSLog(@"str----转化成可用的字符串---%@",requestTmp);
    NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableContainers error:nil];  //解析
    NSLog(@"------dic-----%@",resultDic);
    return resultDic;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondViewController * vc = [[SecondViewController alloc]init];
    
    //    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    //    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
