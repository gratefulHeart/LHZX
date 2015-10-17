//
//  BackFirstViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/10/17.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "BackFirstViewController.h"

@interface BackFirstViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation BackFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"乐活纵享";
    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"加载中";
    
    
    myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid!=nil||![mid isEqualToString:@""]||![mid isKindOfClass:[NSNull class]]) {
        
    }
    else
    {
        mid = @"";
    }
    
    
    
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/Home/Member/index"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30]];
    
    myWebView.delegate = self;
    myWebView.scrollView.bounces = NO;
    [self.view addSubview:myWebView];

}
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
    [self.hud hide:YES afterDelay:0.1];
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
