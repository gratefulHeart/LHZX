//
//  UserInfo.h
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/19.
//  Copyright © 2015年 GFY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property(nonatomic,strong)NSString *userTel;
@property(nonatomic,strong)NSString *userPwd;
@property(nonatomic,strong)NSString *userMid;

+(instancetype)shareInstance;
-(void)updateAllData;
@end
