//
//  XinShouXueTangViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "XinShouXueTangViewController.h"

@interface XinShouXueTangViewController ()

@end

@implementation XinShouXueTangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新手学堂";

    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/Member/about"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60]];
    myWebView.scrollView.bounces = NO;
    [self.view addSubview:myWebView];
    
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
