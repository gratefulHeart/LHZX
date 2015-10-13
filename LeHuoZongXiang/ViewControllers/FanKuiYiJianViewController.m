//
//  FanKuiYiJianViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "FanKuiYiJianViewController.h"

@interface FanKuiYiJianViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@end

@implementation FanKuiYiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"加载中";
    
    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    myWebView.delegate = self;
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/index.php?g=Home&m=Member&a=feedback"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60]];
    [self.view addSubview:myWebView];
    
}
#pragma mark UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.hud hide:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = [NSString stringWithFormat:@"%@",[error localizedDescription]];//@"加载失败，网络异常";
    [self.hud hide:YES afterDelay:0.5];
    [self.hud hide:YES];
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
