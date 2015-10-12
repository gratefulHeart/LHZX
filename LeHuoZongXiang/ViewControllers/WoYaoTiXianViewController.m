//
//  WoYaoTiXianViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "WoYaoTiXianViewController.h"

@interface WoYaoTiXianViewController ()
{
    UIWebView *myWebView;
}
@end

@implementation WoYaoTiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    
//    // 寻找URL为HOST的相关cookie，不用担心，步骤2已经自动为cookie设置好了相关的URL信息
//    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com"]]; // 这里的HOST是你web服务器的域名地址
//    // 比如你之前登录的网站地址是abc.com（当然前面要加http://，如果你服务器需要端口号也可以加上端口号），那么这里的HOST就是http://abc.com
//    
//    // 设置header，通过遍历cookies来一个一个的设置header
//    for (NSHTTPCookie *cookie in cookies){
//        
//        // cookiesWithResponseHeaderFields方法，需要为URL设置一个cookie为NSDictionary类型的header，注意NSDictionary里面的forKey需要是@"Set-Cookie"
//        NSArray *headeringCookie = [NSHTTPCookie cookiesWithResponseHeaderFields:
//                                    [NSDictionary dictionaryWithObject:
//                                     [[NSString alloc] initWithFormat:@"%@=%@",[cookie name],[cookie value]]
//                                                                forKey:@"Set-Cookie"]
//                                                                          forURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com"]];
//        
//        
//        NSLog(@"氢气；u的凯撒附件老师 %@",[[NSString alloc] initWithFormat:@"%@=%@",[cookie name],[cookie value]]);
//        
//        // 通过setCookies方法，完成设置，这样只要一访问URL为HOST的网页时，会自动附带上设置好的header
//        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:headeringCookie
//                                                           forURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com"]
//                                                  mainDocumentURL:nil];
//
//    }
    
    
    
    
    
//    NSDictionary *properties =  [NSDictionary dictionaryWithObjectsAndKeys:
//                                 
//                                 @"70798",NSHTTPCookieValue,                // token值
//                                 
//                                 @"mid", NSHTTPCookieName,             // token名
//                                 
//                                 @"/", NSHTTPCookiePath,                          // 路径
//                                 
//                                 @"www.lehuozongxiang.com" ,NSHTTPCookieDomain,            // 域
//                                 
//                                 nil];
//    
//    NSHTTPCookie *cookie_PD1 = [NSHTTPCookie cookieWithProperties:properties];
//    
//    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie_PD1];
    
    
//    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/index.php?g=Home&m=Member&a=withdraw_mobile"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60]];
    
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com/index.php?g=Home&m=Member&a=withdraw_mobile"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60]];

    [self.view addSubview:myWebView];
    
    
    
    
    
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        NSLog(@"我要提现页面      所有的 cookie%@", cookie);
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
