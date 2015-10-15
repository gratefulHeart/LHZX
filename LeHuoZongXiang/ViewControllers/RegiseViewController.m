//
//  RegiseViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/19.
//  Copyright © 2015年 GFY. All rights reserved.
//

#import "RegiseViewController.h"
#import "RegiseTwoViewController.h"
@interface RegiseViewController ()<UITextFieldDelegate>
{
    UITextField *userTF;
    UIButton *loginBtn;
    
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation RegiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    [self resetNav];
    [self createLeftAndRightBar];
    
    
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
-(void)createUI
{
    UIImageView *leftImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 80, 13)];
    leftImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftImgV];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 80, 30)];
    nameLabel.text = @"手机号";
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
    userTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:userTF];

    
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setFrame:CGRectMake(20, 100, (SCREEN_WIDTH-40), 40)];
    [loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:COLOR_WITH_RGB(77, 223, 91)];
    [self.view addSubview:loginBtn];
    
}
//注册
-(void)loginBtnClick:(UIButton *)b
{

    if([userTF.text length]!=11){

        [AllTools messageViewWithText:@"请输入正确的手机号!"];
        return;
    }
    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"注册中";

    
    NSString *mUrl = [NSString stringWithFormat:@"%@g=Home&m=Api&a=sendsms&tel=%@",SERVER_HOST,userTF.text];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:mUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        if([[responseObject objectForKey:@"code"] intValue]>0){
        
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                RegiseTwoViewController *regiseTwoVC = [[RegiseTwoViewController alloc]init];
                regiseTwoVC.userPhone = userTF.text;
                [self.navigationController pushViewController:regiseTwoVC animated:YES];
                
            });
        }
        
        
        
        NSString *msg = [responseObject objectForKey:@"msg"];
        
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"验证码发送成功":msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:1.1];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        NSString *msg = [error localizedDescription];
        
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
    }];

    

    
}
-(void)touchesBegan:(UITouch*)touches withEvent:(UIEvent *)event
{
    [userTF resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
    
    

}
-(void)leftBtnClick:(UIButton *)b
{
    [self.navigationController popViewControllerAnimated:YES];
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
