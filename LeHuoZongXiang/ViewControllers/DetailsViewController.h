//
//  DetailsViewController.h
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/9/15.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import "BaseViewController.h"
#import "UMSocialControllerService.h"

@interface DetailsViewController : UIViewController<UMSocialUIDelegate>
@property(nonatomic,strong)NSString *mUrl;

@end
