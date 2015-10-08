//
//  YingYongTiYanViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "YingYongTiYanViewController.h"

@interface YingYongTiYanViewController ()


@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation YingYongTiYanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    [self startFirstRequest];
    
    
}

-(void)createUI
{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/510.0*310)];
    imgV.image = LOADIMAGE(@"integralrule", @"png");
    [self.view addSubview:imgV];

}
-(void)startFirstRequest
{
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"请稍后";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *mid = [uf objectForKey:@"mid"];
    if (mid==nil||[mid isEqualToString:@""]) {
        
        [AllTools messageViewWithText:@"亲，您还没登陆呢"];
        return;
    }
//    NSDictionary *parameters = @{@"mid":mid};
    
    NSString *urlStr = [NSString stringWithFormat:@"http://wz.lehuozongxiang.com/index.php?g=Home&m=Api&a=integralwall_is_able&mid=%@",mid];
    NSLog(@"请求链接：%@",urlStr);
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject==%@",responseObject);

        if([[responseObject objectForKey:@"code"]boolValue]){
        
            
//            添加积分墙
        }
        NSString *msg = [responseObject objectForKey:@"title"];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"成功":msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *msg = [error localizedDescription];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
    }];
    
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
