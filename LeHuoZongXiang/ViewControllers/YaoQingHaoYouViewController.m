//
//  YaoQingHaoYouViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "YaoQingHaoYouViewController.h"

#import "UMSocialSnsService.h"
#import "AppDelegate.h"
#import "UMSocialSnsPlatformManager.h"
@interface YaoQingHaoYouViewController ()
{
    UIWebView *myWebView;
}
@end

@implementation YaoQingHaoYouViewController
-(void)createRightBar
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(10, 0, 44, 44)];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:LOADIMAGE(@"share_btn", @"png") forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item1;
}
-(void)rightBtnClick:(UIButton *)b
{
    NSString *title = [myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSString *shareText = title;//@"为中华之崛起而奋斗不息！";             //分享内嵌文字
    UIImage *shareImage = [UIImage imageNamed:@"icon_58"];         //分享内嵌图片

    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://www.lehuozongxiang.com";
    [UMSocialData defaultData].extConfig.qqData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://www.lehuozongxiang.com";
    [UMSocialData defaultData].extConfig.qzoneData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.lehuozongxiang.com";
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.lehuozongxiang.com";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"分享";
    
    [UMSocialData defaultData].extConfig.sinaData.shareImage = shareImage;
    [UMSocialData defaultData].extConfig.sinaData.urlResource.resourceType = UMSocialUrlResourceTypeImage;
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UmengAppkey
                                      shareText:shareText
                                     shareImage:shareImage
                                shareToSnsNames:@[UMShareToQzone,UMShareToQQ,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToTencent,UMShareToSina]
                                       delegate:self];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"邀请好友";
    
    [self createRightBar];
    
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid!=nil||![mid isEqualToString:@""]||![mid isKindOfClass:[NSNull class]]) {
        
    }
    else
    {
        mid = @"";
    }
    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.lehuozongxiang.com/r/%@/b/2",mid]] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60]];
    myWebView.scrollView.bounces = NO;
    [myWebView sizeToFit];
    
    [self.view addSubview:myWebView];
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
