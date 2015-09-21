//
//  RootNavViewController.m
//  ZhiKang
//
//  Created by z,k on 15/5/4.
//  Copyright (c) 2015年 zk. All rights reserved.
//

#import "RootNavViewController.h"

@interface RootNavViewController ()

@end

@implementation RootNavViewController
- (NSString *)fileDataPathWithFileFinder:(NSString *)finder andFileNamed:(NSString *)fileNamed
{
    if ([finder isKindOfClass:[NSNull class]])
    {
        finder = @"";
    }
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:finder];
    NSLog(@"filePath===%@",filePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:filePath])
    {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [filePath stringByAppendingPathComponent:fileNamed];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSString *finder = [[NSBundle mainBundle]pathForResource:@"WelcomeImages" ofType:@"bundle"];//[self fileDataPathWithFileFinder:@"WelcomeView" andFileNamed:nil];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *show = [userDefaults objectForKey:@"ShowWelcome"];
//    show = @"YES";
    if(!show)
    {
        [userDefaults setObject:@"YES" forKey:@"ShowWelcome"];
    }
    
    if ([[userDefaults objectForKey:@"ShowWelcome"] isEqualToString:@"YES"])
    {
        WelcomeManager *welcomeView = [[WelcomeManager alloc] initWithFrame:self.view.bounds finder:finder];
        [self.view addSubview:welcomeView];
        [userDefaults setObject:@"NO" forKey:@"ShowWelcome"];
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
