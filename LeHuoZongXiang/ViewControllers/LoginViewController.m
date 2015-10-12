//
//  LoginViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/16.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "LoginViewController.h"
#import "RegiseViewController.h"
#import "ForgetPasswordViewController.h"
#import "PersonInfoViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField *userTF;
    UITextField *passTF;
    
    UIButton *loginBtn;
    UIButton *registeBtn;
    UIButton *wjPasswordBtn;
    
    
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录/注册";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
    
}
-(void)createUI
{
    UIImageView *leftImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 80, 13)];
    leftImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftImgV];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 80, 30)];
    nameLabel.text = @"账号";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    
    UIImageView *rightImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 60, SCREEN_WIDTH-120, 13)];
    rightImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightImgV];
    
    
    userTF = [[UITextField alloc]initWithFrame:CGRectMake(110, 40, SCREEN_WIDTH-130, 30)];
    userTF.delegate = self;
    userTF.placeholder = @"请输入手机号";
    userTF.keyboardType = UIKeyboardTypePhonePad;
    userTF.clearsOnBeginEditing = YES;
//    userTF.text = @"15652934696";
    userTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:userTF];
    
    UIImageView *leftTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 140, 80, 13)];
    leftTwoImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftTwoImgV];
    
    UILabel *nameTwoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 80, 30)];
    nameTwoLabel.text = @"密码";
    nameTwoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameTwoLabel];
    
    UIImageView *rightTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 140, SCREEN_WIDTH-120, 13)];
    rightTwoImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightTwoImgV];
    
    passTF = [[UITextField alloc]initWithFrame:CGRectMake(110, 120, SCREEN_WIDTH-130, 30)];
    passTF.delegate = self;
    passTF.secureTextEntry = YES;
    passTF.returnKeyType = UIReturnKeyDone;
    passTF.placeholder = @"请输入手机号";
//    passTF.text = @"234567";
    [self.view addSubview:passTF];
    
    
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setFrame:CGRectMake(20, 180, (SCREEN_WIDTH-50)/4.0*3, 40)];
    [loginBtn setTitle:@"一键登录" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:COLOR_WITH_RGB(77, 223, 91)];
    [self.view addSubview:loginBtn];
    
    
    registeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [registeBtn setFrame:CGRectMake(30+(SCREEN_WIDTH-50)/4.0*3, 180, (SCREEN_WIDTH-50)/4.0, 40)];
    [registeBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registeBtn setTintColor:[UIColor whiteColor]];
    [registeBtn addTarget:self action:@selector(registeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [registeBtn setBackgroundColor:COLOR_WITH_RGB(77, 223, 91)];
    [self.view addSubview:registeBtn];
    
    
    
    wjPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [wjPasswordBtn setFrame:CGRectMake(30+(SCREEN_WIDTH-50)/4.0*3, 230, (SCREEN_WIDTH-50)/4.0, 40)];
    [wjPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [wjPasswordBtn addTarget:self action:@selector(wjPasswordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    wjPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [wjPasswordBtn setTintColor:COLOR_WITH_RGB(82, 82, 82)];
    [wjPasswordBtn setBackgroundColor:CLEARCOLOR];
    [self.view addSubview:wjPasswordBtn];
    
}
-(void)touchesBegan:(UITouch*)touches withEvent:(UIEvent *)event
{
    [userTF resignFirstResponder];
    [passTF resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
//登陆
-(void)loginBtnClick:(UIButton *)b
{
    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"登录中";

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"uname":userTF.text,@"pwd":passTF.text};
    
    [manager POST:@"http://wz.lehuozongxiang.com/index.php?g=Home&m=Api&a=login&from=ios" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject==%@",responseObject);
        NSError * e = nil ;
        NSDictionary *dataInfo = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&e];
        
        NSLog(@"JSON: %@", dataInfo);
        
        if([[dataInfo objectForKey:@"ok"]intValue]>0){
        
            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
            [userDef setObject:[NSString stringWithFormat:@"%@",[dataInfo objectForKey:@"mid"]] forKey:@"mid"];
            [userDef setObject:userTF.text forKey:@"tel"];
            [userDef setObject:passTF.text forKey:@"pwd"];
            [userDef synchronize];
            
            UserInfo *uf = [UserInfo shareInstance];
            [uf updateAllData];
            
//            [self.revealViewController revealToggleAnimated:YES];
            
            SWRevealViewController *revealViewController = self.revealViewController;
            PersonInfoViewController *loginVC = [[PersonInfoViewController alloc]init];
            UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
            //调用pushFrontViewController进行页面切换
            [revealViewController pushFrontViewController:centerNav animated:YES];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginUpdate" object:nil];
            
            NSDictionary *properties =  [NSDictionary dictionaryWithObjectsAndKeys:
                                         
                                         [NSString stringWithFormat:@"%@",[dataInfo objectForKey:@"mid"]],NSHTTPCookieValue,                // token值
                                         
                                         @"mid", NSHTTPCookieName,             // token名
                                         
                                         @"/", NSHTTPCookiePath,                          // 路径
                                         
                                         @"www.lehuozongxiang.com" ,NSHTTPCookieDomain,            // 域
                                         
                                         nil];
            
            NSHTTPCookie *cookie_PD1 = [NSHTTPCookie cookieWithProperties:properties];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie_PD1];
            
//            NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//            for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//                NSLog(@"登陆页面    222222===  所有的 cookie%@", cookie);
//            }
            
        }

        
        NSString *msg = [dataInfo objectForKey:@"msg"];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"登录成功":msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSString *msg = [error localizedDescription];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
    }];
    
}
//注册
-(void)registeBtnClick:(UIButton *)b
{
    RegiseViewController *regiseVC = [[RegiseViewController alloc]init];
    [self.navigationController pushViewController:regiseVC animated:YES];
}
//忘记密码
-(void)wjPasswordBtnClick:(UIButton *)b
{
    ForgetPasswordViewController *forgetVC = [[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
    
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
