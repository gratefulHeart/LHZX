//
//  YingYongTiYanViewController.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "YingYongTiYanViewController.h"
#import "JfqTableViewCell.h"

#import "PublicCallList.h"

@interface YingYongTiYanViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *myTableView;
    NSMutableArray *dataArray;
    
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation YingYongTiYanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dataArray = [[NSMutableArray alloc]init];
    
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    [self startFirstRequest];
    
    
}
-(void)createMyTableView
{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH/510.0*310, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_WIDTH/510.0*310-64) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource =self;
    myTableView.bounces = NO;
    [self.view addSubview:myTableView];
    [self setExtraCellLineHidden:myTableView];
    
}

-(void)createUI
{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/510.0*310)];
    imgV.image = LOADIMAGE(@"integralrule", @"png");
    [self.view addSubview:imgV];
    
    [self createMyTableView];

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


//        NSString *msg = [responseObject objectForKey:@"title"];
//        self.hud.mode =  MBProgressHUDModeText;
//        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"成功":msg];//@"网络请求成功";
        [self.hud hide:YES ];
        
        if([[responseObject objectForKey:@"code"]intValue]>0){
            
            [self startTwoRequest];
            
            //            添加积分墙
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *msg = [error localizedDescription];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
    }];
    
}

-(void)startTwoRequest
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

//    {"QUI":"用户ID", "QPI":"平台ID", "QAI":"应用ID"}
    NSString *QUI = @"";
    NSString *QPI = @"";
    NSString *QAI = @"";
    
    NSString *urlStr = [NSString stringWithFormat:@"http://iwi.lehuozongxiang.com/query.php?QUI=%@&QPI=%@&QAI=%@",QUI,QPI,QAI];
    NSLog(@"请求链接：%@",urlStr);
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"RPC"]] forKey:@"RPC"];
        [dict setObject:@"推荐应用体验一" forKey:@"name"];
        [dataArray addObject:dict];
        [myTableView reloadData];
        
        NSLog(@"responseObject==%@",responseObject);
//        if([[responseObject objectForKey:@"code"]boolValue]){
//            
//            
//            //            添加积分墙
//        }
//        NSString *msg = [responseObject objectForKey:@"title"];
//        self.hud.mode =  MBProgressHUDModeText;
//        self.hud.labelText = [NSString stringWithFormat:@"%@",[msg isEqualToString:@""]?@"成功":msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *msg = [error localizedDescription];
        self.hud.mode =  MBProgressHUDModeText;
        self.hud.labelText = [NSString stringWithFormat:@"%@",msg];//@"网络请求成功";
        [self.hud hide:YES afterDelay:0.5];
        
    }];
    
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ceid = @"JfqTableViewCell";
    JfqTableViewCell *cell = (JfqTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ceid];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:ceid owner:nil options:nil]lastObject];
    }
    NSDictionary *dict = [dataArray objectAtIndex:indexPath.row];
    cell.nameL.text = [dict objectForKey:@"name"];
    cell.scoreL.text = [NSString stringWithFormat:@"%@分",[dict objectForKey:@"RPC"]];
    cell.priceL.text = @"暂无";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [PublicCallList PublicCallShowOffers:YES PublicCallDidShowBlock:^{
        NSLog(@"有米积分墙已显示");
    } PublicDidDismissBlock:^{
        NSLog(@"有米积分墙已退出");
    }];
    
}


-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
//    [view release];
    
}

#pragma mark UITableViewDelegate

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
