//
//  UserInfo.m
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/19.
//  Copyright © 2015年 GFY. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
+(instancetype)shareInstance
{
    static id _shareInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _shareInstance = [[self alloc]init];
        
    });
    
    return _shareInstance;
}

-(void)updateAllData
{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSString *tel = [userDef objectForKey:@"tel"];
    NSString *pwd = [userDef objectForKey:@"pwd"];
    NSString *mid = [userDef objectForKey:@"mid"];

    if (tel!=nil) {
        self.userTel = [NSString stringWithFormat:@"%@",tel];
        self.userPwd = [NSString stringWithFormat:@"%@",pwd];
        self.userMid = [NSString stringWithFormat:@"%@",mid];
    }
    else
    {
        self.userTel = nil;
        self.userPwd = nil;
        self.userMid = nil;
    }
}
@end
