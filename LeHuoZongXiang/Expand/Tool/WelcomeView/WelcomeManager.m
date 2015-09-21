//
//  WelcomeManager.m
//  iMobbyMobile
//
//  Created by up72 on 13-9-13.
//  Copyright (c) 2013年 up72. All rights reserved.
//

#import "WelcomeManager.h"

@implementation WelcomeManager

//- (void)dealloc
//{
//    [pageControl release];
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame finder:(NSString *)finder
{
    self = [super initWithFrame:frame];
    if (self)
    {
        WelcomeView *welcomeView = [[WelcomeView alloc] initWithFrame:self.bounds
                                                               finder:finder];
        welcomeView.wDelete = self;
        [self addSubview:welcomeView];
        
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, frame.size.width, 40)];
        
         if ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
         {
             pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
             pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
         }

        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.numberOfPages = welcomeView.pageCount ;
//        pageControl.hidden = YES;
        [self addSubview:pageControl];
        
        
//        [welcomeView release];
    }
    return self;
}


- (void)welcomeViewDidScroll:(WelcomeView *)welcomeView
{
    pageControl.currentPage = welcomeView.contentOffset.x/welcomeView.frame.size.width;

//    if (pageControl.currentPage == pageControl.numberOfPages - 1)
//    {
//        pageControl.hidden = YES;
//    }
//    else
//    {
//        pageControl.hidden = NO;
//    }
}

- (void)welcomeViewRemove:(WelcomeView *)welcomeView
{
    [UIView animateWithDuration:1.0 animations:^
     {
         self.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
         self.alpha = 0.0f;
     }
                     completion:^(BOOL finished)
     {
         [self removeFromSuperview];
     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
