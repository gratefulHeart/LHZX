//
//  ModifyPassWordViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/16.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "ModifyPassWordViewController.h"

#define Yoffst_Start  60
#define indival  60
@interface ModifyPassWordViewController ()<UITextFieldDelegate>
{
    UITextField *userTF;
    UITextField *passTF;
    UITextField *passTFTwo;
    
    UIButton *loginBtn;
    
    
}
@end

@implementation ModifyPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"修改密码";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self resetNav];
    [self createLeftAndRightBar];
    [self createUI];
    
    
    
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



-(void)createUI
{
    UIImageView *leftImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffst_Start, 80, 13)];
    leftImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftImgV];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffst_Start-20, 80, 30)];
    nameLabel.text = @"当前密码";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    
    UIImageView *rightImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffst_Start, SCREEN_WIDTH-120, 13)];
    rightImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightImgV];
    
    
    userTF = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffst_Start-20, SCREEN_WIDTH-130, 30)];
    userTF.delegate = self;
    userTF.placeholder = @"请输入当前密码";
//    userTF.keyboardType = UIKeyboardTypePhonePad;
    userTF.clearsOnBeginEditing = YES;
    userTF.text = @"15652934696";
    userTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:userTF];
    
    UIImageView *leftTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffst_Start+indival, 80, 13)];
    leftTwoImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftTwoImgV];
    
    UILabel *nameTwoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffst_Start+indival-20, 80, 30)];
    nameTwoLabel.text = @"新密码";
    nameTwoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameTwoLabel];
    
    UIImageView *rightTwoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffst_Start+indival, SCREEN_WIDTH-120, 13)];
    rightTwoImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightTwoImgV];
    
    passTF = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffst_Start+indival-20, SCREEN_WIDTH-130, 30)];
    passTF.delegate = self;
    passTF.secureTextEntry = YES;
    passTF.returnKeyType = UIReturnKeyDone;
    passTF.placeholder = @"请输入新的密码";
//    passTF.text = @"234567";
    [self.view addSubview:passTF];
    
    
    UIImageView *leftThreeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(20, Yoffst_Start+indival*2, 80, 13)];
    leftThreeImgV.image = [LOADIMAGE(@"lhzx_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];//LOADIMAGE(@"lhzx_bg", @"png");
    [self.view addSubview:leftThreeImgV];
    
    UILabel *nameThreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, Yoffst_Start+indival*2-20, 80, 30)];
    nameThreeLabel.text = @"重复密码";
    nameThreeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameThreeLabel];
    
    UIImageView *rightThreeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(100, Yoffst_Start+indival*2, SCREEN_WIDTH-120, 13)];
    rightThreeImgV.image = [LOADIMAGE(@"lhzx_input_bg", @"png") stretchableImageWithLeftCapWidth:28 topCapHeight:7];
    [self.view addSubview:rightThreeImgV];
    
    passTFTwo = [[UITextField alloc]initWithFrame:CGRectMake(110, Yoffst_Start+indival*2-20, SCREEN_WIDTH-130, 30)];
    passTFTwo.delegate = self;
    passTFTwo.secureTextEntry = YES;
    passTFTwo.returnKeyType = UIReturnKeyDone;
    passTFTwo.placeholder = @"请重复新的密码";
//    passTFTwo.text = @"234567";
    [self.view addSubview:passTFTwo];
    

    
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setFrame:CGRectMake(20, Yoffst_Start+indival*3, (SCREEN_WIDTH-40), 40)];
    [loginBtn setTitle:@"修改密码" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:COLOR_WITH_RGB(77, 223, 91)];
    [self.view addSubview:loginBtn];
    
    
    
}
-(void)touchesBegan:(UITouch*)touches withEvent:(UIEvent *)event
{
    [userTF resignFirstResponder];
    [passTF resignFirstResponder];
    [passTFTwo resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)loginBtnClick:(UIButton *)b
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
