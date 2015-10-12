//
//  PersonInfoViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/16.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "ModifyPassWordViewController.h"
#import "AboutAppViewController.h"
#import "LoginViewController.h"

@interface PersonInfoViewController ()<UIAlertViewDelegate>
{
    UIButton *firstBtn;
    UIButton *modifyBtn;
    UIButton *zhuXiaoBtn;
    UIButton *cleanBtn;
    UIButton *aboutBtn;
    
}
@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
    
}
-(void)createUI
{
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *tel = [uf objectForKey:@"tel"];
    NSString *mid = [uf objectForKey:@"mid"];
    
    
    firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstBtn setFrame:CGRectMake(10, 20, SCREEN_WIDTH-20, 80)];
    [firstBtn addTarget:self action:@selector(firstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image1 = [LOADIMAGE(@"back1", @"png") stretchableImageWithLeftCapWidth:6 topCapHeight:8];
    [firstBtn setBackgroundImage:image1 forState:UIControlStateNormal];
    [firstBtn setBackgroundImage:image1 forState:UIControlStateHighlighted];
    [self.view addSubview:firstBtn];
    
    UIImageView *headImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    headImgV.image = LOADIMAGE(@"head_default", @"png");
    headImgV.layer.cornerRadius = 30.0f;
    headImgV.layer.masksToBounds = YES;
    [firstBtn addSubview:headImgV];
    
    
    
    UILabel *labelId = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, SCREEN_WIDTH-40, 40)];
    labelId.textColor = COLOR_WITH_RGB(55, 55, 55);
    labelId.text = mid;//@"123456";
    labelId.font = [UIFont systemFontOfSize:20];
    [firstBtn addSubview:labelId];
    
    UILabel *telLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,40, SCREEN_WIDTH-40, 30)];
    telLabel.textColor = COLOR_WITH_RGB(156, 156, 156);
    telLabel.font = [UIFont systemFontOfSize:12];
    telLabel.text = tel;//@"15652934696";
    [firstBtn addSubview:telLabel];

    
    modifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [modifyBtn setFrame:CGRectMake(10, 110, SCREEN_WIDTH-20, 50)];
    [modifyBtn addTarget:self action:@selector(modifyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image2 = [LOADIMAGE(@"back3", @"png") stretchableImageWithLeftCapWidth:6 topCapHeight:10];
    [modifyBtn setBackgroundImage:image2 forState:UIControlStateNormal];
    [modifyBtn setBackgroundImage:image2 forState:UIControlStateHighlighted];
    [self.view addSubview:modifyBtn];
//
    UIImageView *modifyImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 13, 25, 25)];
    modifyImgV.image = LOADIMAGE(@"wemall_user_changepasswd", @"png");
    [modifyBtn addSubview:modifyImgV];
//
    UILabel *modifyLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,10, SCREEN_WIDTH-40, 30)];
    modifyLabel.textColor =COLOR_WITH_RGB(55, 55, 55);
    modifyLabel.font = [UIFont systemFontOfSize:17];
    modifyLabel.text = @"修改密码";
    [modifyBtn addSubview:modifyLabel];


    zhuXiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [zhuXiaoBtn setFrame:CGRectMake(10, 170, SCREEN_WIDTH-20, 50)];
    [zhuXiaoBtn addTarget:self action:@selector(zhuXiaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image3 = [LOADIMAGE(@"back2", @"png") stretchableImageWithLeftCapWidth:6 topCapHeight:8];
    [zhuXiaoBtn setBackgroundImage:image3 forState:UIControlStateNormal];
    [zhuXiaoBtn setBackgroundImage:image3 forState:UIControlStateHighlighted];
    [self.view addSubview:zhuXiaoBtn];
    //
    UIImageView *zhuXiaoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 13, 25, 25)];
    zhuXiaoImgV.image = LOADIMAGE(@"user_logout", @"png");
    [zhuXiaoBtn addSubview:zhuXiaoImgV];
    UILabel *zhuXiaoLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,10, SCREEN_WIDTH-40, 30)];
    zhuXiaoLabel.textColor =COLOR_WITH_RGB(55, 55, 55);
    zhuXiaoLabel.font = [UIFont systemFontOfSize:17];
    zhuXiaoLabel.text = @"注销账户";
    [zhuXiaoBtn addSubview:zhuXiaoLabel];

    
    
    cleanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cleanBtn setFrame:CGRectMake(10, 219, SCREEN_WIDTH-20, 50)];
    [cleanBtn addTarget:self action:@selector(cleanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cleanBtn setBackgroundImage:image3 forState:UIControlStateNormal];
    [cleanBtn setBackgroundImage:image3 forState:UIControlStateHighlighted];
    [self.view addSubview:cleanBtn];
    //
    UIImageView *cleanImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 13, 25, 25)];
    cleanImgV.image = LOADIMAGE(@"wemall_user_cleaning_app", @"png");
    [cleanBtn addSubview:cleanImgV];
    UILabel *cleanLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,10, SCREEN_WIDTH-40, 30)];
    cleanLabel.textColor =COLOR_WITH_RGB(55, 55, 55);
    cleanLabel.font = [UIFont systemFontOfSize:17];
    cleanLabel.text = @"清理缓存";
    [cleanBtn addSubview:cleanLabel];

    
    aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [aboutBtn setFrame:CGRectMake(10, 268, SCREEN_WIDTH-20, 50)];
    [aboutBtn addTarget:self action:@selector(aboutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image4 = [LOADIMAGE(@"back1", @"png") stretchableImageWithLeftCapWidth:6 topCapHeight:8];

    [aboutBtn setBackgroundImage:image4 forState:UIControlStateNormal];
    [aboutBtn setBackgroundImage:image4 forState:UIControlStateHighlighted];
    [self.view addSubview:aboutBtn];
    //
    UIImageView *aboutImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 13, 25, 25)];
    aboutImgV.image = LOADIMAGE(@"wemall_user_about_app", @"png");
    [aboutBtn addSubview:aboutImgV];
    UILabel *aboutLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,10, SCREEN_WIDTH-40, 30)];
    aboutLabel.textColor =COLOR_WITH_RGB(55, 55, 55);
    aboutLabel.font = [UIFont systemFontOfSize:17];
    aboutLabel.text = @"关于应用";
    [aboutBtn addSubview:aboutLabel];
    
}
//账户
-(void)firstBtnClick:(UIButton *)b
{
    
}
-(void)modifyBtnClick:(UIButton *)b
{
    ModifyPassWordViewController *modifyPasswordVC = [[ModifyPassWordViewController alloc]init];
    [self.navigationController pushViewController:modifyPasswordVC animated:YES];
}
-(void)zhuXiaoBtnClick:(UIButton *)b
{
    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定注销吗" delegate:self cancelButtonTitle:@"注销用户" otherButtonTitles:@"取消", nil];
    [al show];
    
    
}
-(void)cleanBtnClick:(UIButton *)b
{

    [AllTools messageViewWithText:@"缓存已清空"];
}
-(void)aboutBtnClick:(UIButton *)b
{
    AboutAppViewController *aboutVC = [[AboutAppViewController alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0) {
       
        
        NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
        [uf removeObjectForKey:@"tel"];
        [uf removeObjectForKey:@"pwd"];
        [uf removeObjectForKey:@"mid"];
        [uf synchronize];
//        NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
//        NSDictionary * dict = [defs dictionaryRepresentation];
//        for (id key in dict) {
//            [defs removeObjectForKey:key];
//        }
//        [defs synchronize];
        
        SWRevealViewController *revealViewController = self.revealViewController;
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        //调用pushFrontViewController进行页面切换
        [revealViewController pushFrontViewController:centerNav animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginUpdate" object:nil];
        
        /**
         *  注销之后清楚缓存！
         */
        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSArray *cookieArray = [NSArray arrayWithArray:[cookieJar cookies]];
        for (id obj in cookieArray) {
            [cookieJar deleteCookie:obj];
        }
        
        
        
    }
    else
    {
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
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
