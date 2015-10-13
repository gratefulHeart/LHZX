//
//  DetailsViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "DetailsViewController.h"
#import "UMSocialSnsService.h"
#import "AppDelegate.h"
#import "UMSocialSnsPlatformManager.h"

@interface DetailsViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@property(nonatomic,strong)UIImage *shareImg;
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation DetailsViewController
-(void)viewDidDisappear:(BOOL)animated
{
    [myWebView stopLoading];
    [myWebView loadHTMLString:@"" baseURL:nil];
    myWebView.delegate = nil;
    [myWebView removeFromSuperview];
    myWebView = nil;
}
-(void)dealloc
{
    [myWebView stopLoading];
    [myWebView loadHTMLString:@"" baseURL:nil];
    myWebView.delegate = nil;
    [myWebView removeFromSuperview];
    myWebView = nil;
}
-(void)resetNav
{
    [self.navigationController.navigationBar setBarTintColor: COLOR_WITH_RGB(253, 189, 10)];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:COLOR_WITH_RGB(255, 200, 0)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情页面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self resetNav];
    [self createLeftAndRightBar];
    
    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"加载中";
    
    
    
    [self createMyWebView];
    
    
    [self startNum];
    

}
-(void)startNum
{
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid==nil||[mid isEqualToString:@""]) {
        mid = @"";
    }
    NSString *mUrl = [NSString stringWithFormat:@"http://www.lehuozongxiang.com/index.php?g=Home&m=Api&a=article_count&mid=%@",mid];
    NSLog(@"mUrl====%@",mUrl);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:mUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [self createBackViewWithNum:[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"count"]]];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        [self createBackViewWithNum:@"0"];

    }];

}
-(void)createMyWebView
{
    myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    myWebView.delegate = self;
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.mUrl] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60]];
    
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid==nil||[mid isEqualToString:@""]) {
        
        [AllTools messageViewWithText:@"亲，您还没登陆呢"];
    }
    
    NSLog(@"详情页链接：%@",self.mUrl);
    
    [self.view addSubview:myWebView];
    

}
-(void)createBackViewWithNum:(NSString *)num
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myWebView.frame), SCREEN_WIDTH, 44)];
    bottomView.backgroundColor = ColorWithRGB_alpha(238, 238, 238, 1);//[UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton *bbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bbtn setFrame:CGRectMake(20, 0, 44, 44)];
//    [bbtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
//    [bbtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [bbtn setBackgroundImage:LOADIMAGE(@"left_arrow", @"png") forState:UIControlStateNormal];
    [bbtn setBackgroundImage:LOADIMAGE(@"left_arrow", @"png") forState:UIControlStateNormal];
    [bbtn addTarget:self action:@selector(bbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:bbtn];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerBtn setFrame:CGRectMake((SCREEN_WIDTH-100)/2.0, 0, 100, 44)];
//    [centerBtn setBackgroundImage:LOADIMAGE(@"shareNum", @"png") forState:UIControlStateNormal];
//    [centerBtn setBackgroundImage:LOADIMAGE(@"shareNum", @"png") forState:UIControlStateNormal];
//    [centerBtn setBackgroundImage:LOADIMAGE(@"shareNewNum", @"png") forState:UIControlStateNormal];
//    [centerBtn setBackgroundImage:LOADIMAGE(@"shareNewNum", @"png") forState:UIControlStateNormal];
    
    [centerBtn setAttributedTitle:[self modifyTitleWithNum:num] forState:UIControlStateNormal];
//    [centerBtn setAttributedTitle:[self modifyTitleWithNum:num] forState:UIControlStateNormal];

    
    [centerBtn addTarget:self action:@selector(bbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:centerBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(SCREEN_WIDTH-64, 0, 44, 44)];
//    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
//    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
    
    [rightBtn setBackgroundImage:LOADIMAGE(@"shareNewIcon", @"png") forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:LOADIMAGE(@"shareNewIcon", @"png") forState:UIControlStateNormal];

    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:rightBtn];
    
    
}
-(NSMutableAttributedString *)modifyTitleWithNum:(NSString *)num
{
    
    NSTextAttachment *textAttach = [[NSTextAttachment alloc] init];
    textAttach.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareNewNum" ofType:@"png"]];
    //    textAttach.bounds = CGRectMake(0, -3, 18, 16);
    textAttach.bounds = CGRectMake(6, -17, 44, 44);
    
    //    l.font = [UIFont systemFontOfSize:14];
    NSAttributedString *strA = [NSAttributedString attributedStringWithAttachment:textAttach];
    NSMutableAttributedString *attributedText =[[NSMutableAttributedString alloc] initWithString:@"" attributes:nil];
    
    NSDictionary *attribs = @{NSFontAttributeName: [UIFont systemFontOfSize:14],NSForegroundColorAttributeName:COLOR_WITH_RGB(250, 89, 20)};
    NSMutableAttributedString *attributedText1 =[[NSMutableAttributedString alloc] initWithString:num attributes:attribs];
    [attributedText appendAttributedString:strA];
    [attributedText appendAttributedString:attributedText1];
    return attributedText;
}


-(void)bbtnClick:(UIButton *)b
{
//    [self.navigationController popViewControllerAnimated:YES];
}
- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 30, 30);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
-(void)createLeftAndRightBar
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10, 0, 44, 44)];
    //    [btn setTitle:@"123" forState:UIControlStateNormal];
    [btn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [btn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(10, 0, 44, 44)];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item1;
}
-(void)leftBtnClick:(UIButton *)b
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnClick:(UIButton *)b
{
    
    
    
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"shells://"]];
    
    
    
    NSString *title = [myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSString *shareText = title;//@"为中华之崛起而奋斗不息！";             //分享内嵌文字
    UIImage *shareImage = [UIImage imageNamed:@"icon_58"];//self.shareImg;//[UIImage imageNamed:@"UMS_social_demo"];          //分享内嵌图片
//    //
    if(self.shareImg){
        shareImage = self.shareImg;
    }
    [UMSocialData defaultData].extConfig.qqData.url = self.mUrl;
    [UMSocialData defaultData].extConfig.qqData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.qzoneData.url = self.mUrl;
    [UMSocialData defaultData].extConfig.qzoneData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = self.mUrl;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = self.mUrl;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.sinaData.shareImage = shareImage;
    [UMSocialData defaultData].extConfig.sinaData.urlResource.url = @"http://www.baidu.com";
    

      [UMSocialSnsService presentSnsIconSheetView:self
                                           appKey:UmengAppkey
                                        shareText:shareText
                                       shareImage:shareImage
                                shareToSnsNames:@[UMShareToQzone,UMShareToQQ,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToTencent,UMShareToSina]
                                       delegate:self];
    
    
}




-(void)didCloseUIViewController:(UMSViewControllerType)fromViewControllerType
{
    NSLog(@"didClose is %d",fromViewControllerType);
}

//下面得到分享完成的回调
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    NSLog(@"didFinishGetUMSocialDataInViewController with response is %@",response);
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }

    NSLog(@"myWebView==%@",myWebView);
    
    [self createMyWebView];

}


#pragma mark UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *picUrl = [myWebView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"wx_pic\").getElementsByTagName('img')[0].src"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:picUrl]];
        
        
        if (data!=nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.shareImg = [UIImage imageWithData:data];
                
            });
        }
        else
        {
            NSLog(@"error");
        }
    });
    
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
