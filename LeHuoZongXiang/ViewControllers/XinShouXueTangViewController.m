//
//  XinShouXueTangViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "XinShouXueTangViewController.h"

@interface XinShouXueTangViewController ()<UIWebViewDelegate>

@end

@implementation XinShouXueTangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新手学堂";

    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"加载中";
    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    myWebView.delegate = self;
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid==nil ||[mid isEqualToString:@""]||[mid isKindOfClass:[NSNull class]]) {
        [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/Public/about"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30]];

    }
    else
    {
        
        [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/Member/about"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30]];
    }

    
    myWebView.scrollView.bounces = NO;
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
