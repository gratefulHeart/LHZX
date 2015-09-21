//
//  WelcomeView.h
//  iMobbyMobile
//
//  Created by up72 on 13-7-17.
//  Copyright (c) 2013年 up72. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LOAD_DOCUMENT_IMAGE(PATH) [UIImage imageWithContentsOfFile:PATH]

@class WelcomeView;

@protocol WelcomeViewDelegate <NSObject>

- (void)welcomeViewDidScroll:(WelcomeView *)welcomeView;
- (void)welcomeViewRemove:(WelcomeView *)welcomeView;
@end

@interface WelcomeView : UIScrollView<UIScrollViewDelegate>
{
    UIView *pageBGView;
    UIView *pageIndexView;
}

@property (nonatomic, assign) id <WelcomeViewDelegate> wDelete;
@property (nonatomic) NSInteger pageCount;

- (id)initWithFrame:(CGRect)frame finder:(NSString *)finder;

@end
