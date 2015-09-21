//
//  WelcomeManager.h
//  iMobbyMobile
//
//  Created by up72 on 13-9-13.
//  Copyright (c) 2013年 up72. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelcomeView.h"

@interface WelcomeManager : UIView<WelcomeViewDelegate>
{
    UIPageControl *pageControl;
}
- (id)initWithFrame:(CGRect)frame finder:(NSString *)finder;

@end
