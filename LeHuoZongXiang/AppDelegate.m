//
//  AppDelegate.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/11.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "FirstViewController.h"


#import "UMSocial.h"
//#import "MobClick.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "RootNavViewController.h"

#import "PublicCallConfig.h"
#import "PublicCallList.h"
#import "PublicCallPointsManager.h"


@interface AppDelegate ()
{
    UIImageView *imageV;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    imageV = [[UIImageView alloc]initWithFrame:self.window.bounds];
    [imageV sd_setImageWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/images/start_ad.jpg"] placeholderImage:LOADIMAGE(@"iphone6", @"png")];
    
    [self.window addSubview:imageV];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(removeLun) userInfo:nil repeats:NO];
    
    
    [self umengShareAndStatistics];
    
    [self zhuCePushWithApplication:application];
    
    
    
    [PublicCallConfig PublicCallLaunchWithAppID:@"a18799efa88ceb24" PublicCallAppSecret:@"a1c636d11bb10380"];
    [PublicCallConfig PublicCallSetUserID:@"this is user"];
    [PublicCallPointsManager PublicCallEnable];
    // 设置显示全屏广告的window
    [PublicCallConfig PublicCallSetFullScreenWindow:self.window];
    
    return YES;
}
-(void)removeLun
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imageV.transform = CGAffineTransformMakeScale(1.6, 1.6);
        imageV.alpha = 0;
        
    } completion:^(BOOL finished) {
        [imageV removeFromSuperview];
        [self createRootWindow];
    }];
    

    
}
/**
 *  注册通知
 */

-(void)zhuCePushWithApplication:(UIApplication *)application
{
    //获取推送权限
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=8.0) {
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge |
                                                UIUserNotificationTypeAlert |
                                                UIUserNotificationTypeSound          categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
        
    }
    else{
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeSound];
        
    }
}
/**
 *  创建RootViewController
 */

-(void)createRootWindow
{
    //左侧菜单栏
    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    
    //首页
    FirstViewController *centerView1Controller = [[FirstViewController alloc] init];
    
    RootNavViewController *centerNav = [[RootNavViewController alloc]initWithRootViewController:centerView1Controller];
    
    
    //右侧菜单栏
    //    RightViewController *rightViewController = [[RightViewController alloc] init];
    
    SWRevealViewController *revealViewController = [[SWRevealViewController alloc] initWithRearViewController:leftViewController frontViewController:centerNav];
    //    revealViewController.rightViewController = rightViewController;
    
    //浮动层离左边距的宽度
    revealViewController.rearViewRevealWidth = 150;
    //    revealViewController.rightViewRevealWidth = 230;
    
    //是否让浮动层弹回原位
    revealViewController.bounceBackOnOverdraw = NO;
    //    revealViewController.bounceBackOnLeftOverdraw = YES;
    [revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    
    self.window.rootViewController = revealViewController;
    
    
}
/**
 *  友盟统计和分享
 */
-(void)umengShareAndStatistics
{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:UmengAppkey];
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
//    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wx66c07640de2fe796" appSecret:@"8920fdd5e9fc0af17f5cb13a91647845" url:@"http://www.umeng.com/social"];
    
    //打开新浪微博的SSO开关
    //    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    //    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //打开腾讯微博SSO开关，设置回调地址，只支持32位
    //    [UMSocialTencentWeiboHandler openSSOWithRedirectUrl:@"http://sns.whalecloud.com/tencent2/callback"];
    
    //    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];

    
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]];
    
    
//    //使用友盟统计
//    [MobClick startWithAppkey:UmengAppkey];
    

    

}
/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
}
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//清除缓存
-(void)aaa
{
    
    NSHTTPCookie *cookie;
    
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (cookie in [storage cookies]) {
        
        [storage deleteCookie:cookie];
        
    }
}

#pragma mark PUSH
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // 处理推送消息
    
    NSLog(@"userinfo:%@",userInfo);
    
    NSLog(@"收到推送消息:%@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"regisger success:%@",deviceToken);
    
    //注册成功，将deviceToken保存到应用服务器数据库中
}



@end
