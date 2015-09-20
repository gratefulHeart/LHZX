//
//  AboutAppViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/20.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "AboutAppViewController.h"

@interface AboutAppViewController ()
{
    UIButton *aboutBtn;
}
@end

@implementation AboutAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self resetNav];
    [self createLeftAndRightBar];
    self.title = @"关于应用";
    [self createUI];
    
    
}
-(void)createUI
{
    UIImageView *iconImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    iconImgV.image = LOADIMAGE(@"icon_120@2x", @"png");
    iconImgV.center = CGPointMake(SCREEN_WIDTH/2.0, 20+60);
    [self.view addSubview:iconImgV];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImgV.frame)+15, SCREEN_WIDTH, 30)];
    titleLabel.text = @"乐活纵享";
    titleLabel.textColor =  COLOR_WITH_RGB(55, 55, 55);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
//    取得本地程序的版本号
    NSDictionary *localDic = [[NSBundle mainBundle] infoDictionary];
    NSString *localVersion = [localDic objectForKey:@"CFBundleShortVersionString"];

    
    UILabel *versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), SCREEN_WIDTH, 30)];
    versionLabel.text = [NSString stringWithFormat:@"V:%@",localVersion];//@"v1.0";
    versionLabel.textColor =  COLOR_WITH_RGB(156, 156, 156);;
    versionLabel.font = [UIFont systemFontOfSize:10];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:versionLabel];
    
    
    
    aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [aboutBtn setFrame:CGRectMake(10, CGRectGetMaxY(versionLabel.frame)+20, SCREEN_WIDTH-20, 50)];
    [aboutBtn addTarget:self action:@selector(aboutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image4 = [LOADIMAGE(@"back1", @"png") stretchableImageWithLeftCapWidth:6 topCapHeight:8];
    
    [aboutBtn setBackgroundImage:image4 forState:UIControlStateNormal];
    [aboutBtn setBackgroundImage:image4 forState:UIControlStateHighlighted];
    [self.view addSubview:aboutBtn];
    //
    UILabel *aboutLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,10, SCREEN_WIDTH-40, 30)];
    aboutLabel.textColor = COLOR_WITH_RGB(156, 156, 156);
    aboutLabel.font = [UIFont systemFontOfSize:17];
    aboutLabel.text = @"官方网站";
    [aboutBtn addSubview:aboutLabel];
    
    UIImageView *aboutImgV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40-10, 10, 12, 24)];
    aboutImgV.image = LOADIMAGE(@"wemall_detail_indicata_right", @"png");
    [aboutBtn addSubview:aboutImgV];

    
}
-(void)aboutBtnClick:(UIButton *)b
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.lehuozongxiang.com"]];
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
