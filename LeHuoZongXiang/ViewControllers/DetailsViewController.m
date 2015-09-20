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

@end

@implementation DetailsViewController
-(void)viewDidDisappear:(BOOL)animated
{
    [myWebView loadHTMLString:@"" baseURL:nil];
    myWebView.delegate = nil;
    [myWebView removeFromSuperview];
    myWebView = nil;
}
-(void)dealloc
{
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
    
    [self resetNav];
    [self createLeftAndRightBar];
    
    myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    myWebView.delegate = self;
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.mUrl] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60]];
    
    [self.view addSubview:myWebView];
    

    [self createBackView];
    
    
}
-(void)createBackView
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myWebView.frame), SCREEN_WIDTH, 44)];
    bottomView.backgroundColor = ColorWithRGB_alpha(238, 238, 238, 1);//[UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton *bbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bbtn setFrame:CGRectMake(20, 0, 44, 44)];
    [bbtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [bbtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [bbtn addTarget:self action:@selector(bbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:bbtn];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerBtn setFrame:CGRectMake((SCREEN_WIDTH-44)/2.0, 0, 44, 44)];
    [centerBtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [centerBtn setBackgroundImage:LOADIMAGE(@"left_new", @"png") forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(bbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:centerBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(SCREEN_WIDTH-64, 0, 44, 44)];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:rightBtn];
    
    
}

-(void)bbtnClick:(UIButton *)b
{
    [self.navigationController popViewControllerAnimated:YES];
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
    
    return;
    
    
    NSString *title = [myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
//    NSLog(@"");
//    NSString *picUrl = [myWebView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"wx_pic\").getElementsByTagName('img')[0].src"];

    
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picUrl]]];
//    if (image) {
//        image = [UIImage imageNamed:@"icon_58"];
//    }
    
    NSString *shareText = title;//@"为中华之崛起而奋斗不息！";             //分享内嵌文字
    UIImage *shareImage = [UIImage imageNamed:@"icon_58"];//self.shareImg;//[UIImage imageNamed:@"UMS_social_demo"];          //分享内嵌图片
//    //
    
    
    
    
//    弹出一个分享列表的类似iOS6的UIActivityViewController控件
//    
//    @param controller 在该controller弹出分享列表的UIActionSheet
//    @param appKey 友盟appKey
//    @param shareText  分享编辑页面的内嵌文字
//    @param shareImage 分享内嵌图片,用户可以在编辑页面删除
//    @param snsNames 你要分享到的sns平台类型，该NSArray值是`UMSocialSnsPlatformManager.h`定义的平台名的字符串常量，有UMShareToSina，UMShareToTencent，UMShareToRenren，UMShareToDouban，UMShareToQzone，UMShareToEmail，UMShareToSms等
//    @param delegate 实现分享完成后的回调对象，如果不关注分享完成的状态，可以设为nil
    
//
    
    [UMSocialData defaultData].extConfig.qqData.url = self.mUrl;//@"http://baidu.com";
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://baidu.com";
    [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
    [UMSocialData defaultData].extConfig.qzoneData.title = @"Qzone分享title";
    //调用快速分享接口
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UmengAppkey
                                      shareText:shareText
                                     shareImage:nil
                                shareToSnsNames:@[UMShareToQzone,UMShareToQQ,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToTencent]
                                       delegate:self];
    
    
}


//下面可以设置根据点击不同的分享平台，设置不同的分享文字
//-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData
//{
//
//    if ([platformName isEqualToString:UMShareToQQ]) {
//        [UMSocialData defaultData].extConfig.qqData.url = self.mUrl;//@"http://baidu.com";
//        [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
//        [UMSocialData defaultData].extConfig.qqData.urlResource.url = @"http://wz.lehuozongxiang.com/Uploads/image/20150826/55dd99b19abbd.png";//@"QQ分享title";
//
//
//    }
//    else if ([platformName isEqualToString:UMShareToQzone]){
//        
//    }
//    else if([platformName isEqualToString:UMShareToSina]){
//    
//    }
//    else if ([platformName isEqualToString:UMShareToTencent]){
//    
//    }
//    else if ([platformName isEqualToString:UMShareToWechatSession]){
//    }
//    else if ([platformName isEqualToString:UMShareToWechatTimeline]){
//    
//        
//    }
//    
////    if ([platformName isEqualToString:UMShareToSina]) {
////        socialData.shareText = @"分享到新浪微博";
////    }
////    else{
////        socialData.shareText = @"分享内嵌文字";
////    }
//}

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

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
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
