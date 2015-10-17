//
//  LeftViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "LeftViewController.h"
#import "FirstViewController.h"
#import "XinShouXueTangViewController.h"
#import "YaoQingHaoYouViewController.h"
#import "WoYaoTiXianViewController.h"
#import "TiXianJiLuViewController.h"
#import "FanKuiYiJianViewController.h"
#import "ShouTuZhuanQianViewController.h"
#import "ZhuanKePaiHangViewController.h"
#import "YingYongTiYanViewController.h"
#import "LoginViewController.h"
#import "PersonInfoViewController.h"

#import "BackFirstViewController.h"

@interface LeftViewController ()
{
    UIButton *headBtn;
    UILabel *nameLabel;
}
@end

@implementation LeftViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


    myArray = @[@"分享赚钱",@"新手学堂",@"邀请好友",@"我要提现",@"提现记录",@"反馈意见",@"收徒赚钱",@"转客排行",@"应用体验",@"返回首页"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"left_background"]];
    [self createMyTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateHeadAndName) name:@"LoginUpdate" object:nil];
}
-(void)createMyTableView
{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource =self;
    [self.view addSubview:myTableView];
    myTableView.bounces = NO;
    myTableView.backgroundColor = CLEARCOLOR;
    
    [self setExtraCellLineHidden:myTableView];
    
    [myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self createHeaderView];
    
}
-(void)createHeaderView
{
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame =CGRectMake(50, 35, 50, 50);
    [headBtn setBackgroundImage:LOADIMAGE(@"user_logout", @"png") forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headV addSubview:headBtn];
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headBtn.frame), 150, 35)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.text = @"登录后，将推荐给您更多感兴趣的文章";
    nameLabel.font = [UIFont systemFontOfSize:11];
    [headV addSubview:nameLabel];
    
    myTableView.tableHeaderView = headV;
    
    [self updateHeadAndName];
    
    
}

-(void)updateHeadAndName
{
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *tel = [uf objectForKey:@"tel"];
    NSString *mid = [uf objectForKey:@"mid"];
    if (tel!=nil) {
        nameLabel.text = [NSString stringWithFormat:@"%@",mid];
        
        
        NSDictionary *properties =  [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     [NSString stringWithFormat:@"%@",mid],NSHTTPCookieValue,                // token值
                                     
                                     @"mid", NSHTTPCookieName,             // token名
                                     
                                     @"/", NSHTTPCookiePath,                          // 路径
                                     
                                     @"www.lehuozongxiang.com" ,NSHTTPCookieDomain,            // 域
                                     
                                     nil];
        
        NSHTTPCookie *cookie_PD1 = [NSHTTPCookie cookieWithProperties:properties];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie_PD1];
        
        
    }
    else
    {
        nameLabel.text = @"登录后，将推荐给您更多感兴趣的文章";

    }
}
-(void)headBtnClick:(UIButton *)b
{
    [self.revealViewController revealToggleAnimated:YES];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *tel = [uf objectForKey:@"tel"];
    if (tel!=nil) {
    
        PersonInfoViewController *loginVC = [[PersonInfoViewController alloc]init];
        
        UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        //调用pushFrontViewController进行页面切换
        [revealViewController pushFrontViewController:centerNav animated:YES];
    }
    else{
    
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        
        UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        //调用pushFrontViewController进行页面切换
        [revealViewController pushFrontViewController:centerNav animated:YES];
    }
    

    

}
#pragma mark UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.backgroundColor = CLEARCOLOR;
        cell.contentView.backgroundColor = CLEARCOLOR;
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.revealViewController revealToggleAnimated:YES];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    UIViewController *viewController;
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    NSString *tel = [uf objectForKey:@"tel"];
    if (tel!=nil) {
//        已登录
        switch (indexPath.row) {
            case 0:
                viewController = [[FirstViewController alloc] init];
                break;
            case 1:
                viewController = [[XinShouXueTangViewController alloc] init];
                break;
            case 2:
                viewController = [[YaoQingHaoYouViewController alloc] init];
                break;
            case 3:
                viewController = [[WoYaoTiXianViewController alloc] init];
                break;
            case 4:
                viewController = [[TiXianJiLuViewController alloc] init];
                break;
            case 5:
                viewController = [[FanKuiYiJianViewController alloc] init];
                break;
            case 6:
                viewController = [[ShouTuZhuanQianViewController alloc] init];
                break;
            case 7:
                viewController = [[ZhuanKePaiHangViewController alloc] init];
                break;
            case 8:
                viewController = [[YingYongTiYanViewController alloc] init];
                break;
            case 9:
                viewController = [[BackFirstViewController alloc] init];
                
                break;
            default:
                break;
        }
    }
    else
    {
//        未登录
        switch (indexPath.row) {
            case 0:
                viewController = [[FirstViewController alloc] init];
                break;
            case 1:
                viewController = [[XinShouXueTangViewController alloc] init];
                break;
            case 2:
                viewController = [[LoginViewController alloc] init];
                break;
            case 3:
                viewController = [[LoginViewController alloc] init];
                break;
            case 4:
                viewController = [[LoginViewController alloc] init];
                break;
            case 5:
                viewController = [[LoginViewController alloc] init];
                break;
            case 6:
                viewController = [[LoginViewController alloc] init];
                break;
            case 7:
                viewController = [[LoginViewController alloc] init];
                break;
            case 8:
                viewController = [[LoginViewController alloc] init];
                break;
            case 9:
                viewController = [[LoginViewController alloc] init];
                break;
            default:
                break;
        }
    }
    

    
    UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:viewController];

    //调用pushFrontViewController进行页面切换
    [revealViewController pushFrontViewController:centerNav animated:YES];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
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
