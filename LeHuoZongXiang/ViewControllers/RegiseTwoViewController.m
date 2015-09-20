//
//  RegiseTwoViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/19.
//  Copyright © 2015年 GFY. All rights reserved.
//

#import "RegiseTwoViewController.h"
#define Yoffset  60
#define Indivial  50
@interface RegiseTwoViewController ()<UITextFieldDelegate>
{
    UITextField *userTF;
    UITextField *yanzhenCodeTF;
    UITextField *passWordTF;
    UITextField *passWordTF2;
    
    UIButton *loginBtn;
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation RegiseTwoViewController

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
    UIImageView *leftImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffset, 80, 13)];
    leftImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftImgV];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffset-20, 80, 30)];
    nameLabel.text = @"手 机 号";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    UIImageView *rightImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffset, SCREEN_WIDTH-120, 13)];
    rightImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightImgV];
    userTF = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffset-20, SCREEN_WIDTH-130, 30)];
    userTF.delegate = self;
    userTF.placeholder = @"请输入手机号";
    userTF.keyboardType = UIKeyboardTypePhonePad;
    userTF.clearsOnBeginEditing = YES;
    userTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:userTF];
    
    
    UIImageView *leftTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial, 80, 13)];
    leftTwoImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftTwoImgV];
    UILabel *nameTwoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial-20, 80, 30)];
    nameTwoLabel.text = @"验 证 码";
    nameTwoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameTwoLabel];
    UIImageView *rightTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffset+Indivial, SCREEN_WIDTH-120, 13)];
    rightTwoImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightTwoImgV];
    yanzhenCodeTF = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffset+Indivial-20, SCREEN_WIDTH-130, 30)];
    yanzhenCodeTF.delegate = self;
    yanzhenCodeTF.placeholder = @"请输入验证码";
    yanzhenCodeTF.keyboardType = UIKeyboardTypePhonePad;
    yanzhenCodeTF.clearsOnBeginEditing = YES;
    yanzhenCodeTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:yanzhenCodeTF];
//    UITextField *yanzhenCodeTF;
//    UITextField *passWordTF;
    
    UIImageView *leftThreeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial*2, 80, 13)];
    leftThreeImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftThreeImgV];
    UILabel *nameThreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial*2-20, 80, 30)];
    nameThreeLabel.text = @"密    码";
    nameThreeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameThreeLabel];
    UIImageView *rightThreeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffset+Indivial*2, SCREEN_WIDTH-120, 13)];
    rightThreeImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightThreeImgV];
    passWordTF = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffset+Indivial*2-20, SCREEN_WIDTH-130, 30)];
    passWordTF.delegate = self;
    passWordTF.placeholder = @"请输入密码，至少六位";
    passWordTF.keyboardType = UIKeyboardTypePhonePad;
    passWordTF.clearsOnBeginEditing = YES;
    passWordTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:passWordTF];

    
    
//    UITextField *passWordTF2;
    
    UIImageView *leftFourImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial*3, 80, 13)];
    leftFourImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftFourImgV];
    UILabel *nameFourLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffset+Indivial*3-20, 80, 30)];
    nameFourLabel.text = @"重复密码";
    nameFourLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameFourLabel];
    UIImageView *rightFourImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffset+Indivial*3, SCREEN_WIDTH-120, 13)];
    rightFourImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightFourImgV];
    passWordTF2 = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffset+Indivial*3-20, SCREEN_WIDTH-130, 30)];
    passWordTF2.delegate = self;
    passWordTF2.placeholder = @"重复密码";
    passWordTF2.keyboardType = UIKeyboardTypePhonePad;
    passWordTF2.clearsOnBeginEditing = YES;
    passWordTF2.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:passWordTF2];
    
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setFrame:CGRectMake(20, Yoffset+Indivial*4, (SCREEN_WIDTH-40), 40)];
    [loginBtn setTitle:@"一键注册" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:COLOR_WITH_RGB(77, 223, 91)];
    [self.view addSubview:loginBtn];
    
}
//注册
-(void)loginBtnClick:(UIButton *)b
{
    
    
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    self.hud.mode =  MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"注册中";
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"uname":userTF.text,@"pwd":passWordTF.text,@"pwd2":passWordTF2.text,@"captcha":yanzhenCodeTF.text};
    
    [manager POST:@"http://www.lehuozongxiang.com/index.php?g=Home&m=Api&a=register&from=ios" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError * e = nil ;
        NSDictionary *dataInfo = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&e];
        
        NSLog(@"JSON: %@", dataInfo);
        
        if([[dataInfo objectForKey:@"ok"]boolValue]){
            
            NSArray *arr = self.navigationController.viewControllers;
            UIViewController *vc = [arr objectAtIndex:[arr count]-3];
            [self.navigationController popToViewController:vc animated:YES];            
        }
        
        
        NSString *msg = [dataInfo objectForKey:@"msg"];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"注册成功":msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSString *msg = [error localizedDescription];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
    }];

    
    
}
-(void)touchesBegan:(UITouch *)touches withEvent:(UIEvent *)event
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
    NSArray *arr = self.navigationController.viewControllers;
    UIViewController *vc = [arr objectAtIndex:[arr count]-3];
    [self.navigationController popToViewController:vc animated:YES];

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
