//
//  FirstViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailsViewController.h"

@interface FirstViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"乐享赚钱";

    
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
    
    
    
    
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://www.lehuozongxiang.com/index.php?g=Home&m=Index&a=index&uid=",mid]]cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60]];
    
    myWebView.delegate = self;
    myWebView.scrollView.bounces = NO;
    [self.view addSubview:myWebView];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.revealViewController revealToggleAnimated:YES];
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = [[request URL] absoluteString];
    urlString = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (urlString!=nil&&[urlString rangeOfString:@"&a=view"].location!=NSNotFound) {
        
        DetailsViewController *detailVC = [[DetailsViewController alloc]init];
        detailVC.mUrl = urlString;
        [self.navigationController pushViewController:detailVC animated:YES];
        
        [webView goBack];
        
        return NO;
    }
    else if (urlString==nil){
    
        [webView goBack];
        return NO;
    }
    
    NSLog(@"urlStr = %@",urlString);
    return YES;
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
