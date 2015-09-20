//
//  YaoQingHaoYouViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "YaoQingHaoYouViewController.h"

@interface YaoQingHaoYouViewController ()
{
    UIWebView *myWebView;
}
@end

@implementation YaoQingHaoYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"邀请好友";
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid!=nil||![mid isEqualToString:@""]) {
        
    }
    else
    {
        mid = @"";
    }    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.lehuozongxiang.com/r/%@/b/2",mid]] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60]];
    myWebView.scrollView.bounces = NO;
    [myWebView sizeToFit];
    
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
