//
//  MessageView.m
//  AllMedia
//
//  Created by admin on 12-8-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MessageView.h"

@interface MessageView()
- (void)disappear;
@end

@implementation MessageView

- (id)initWithFrame:(CGRect)frame andText:(NSString *)title
{
    self = [super initWithFrame:frame];

    if (self) 
    {
        CGSize size = [UIScreen mainScreen].bounds.size;
        CGPoint centerPoint = CGPointMake(size.width/2, size.height/2-60);
        self.center = centerPoint;
        
        UIImageView *bgImageView        = [[UIImageView alloc] initWithFrame:self.bounds];
        bgImageView.backgroundColor     = [UIColor blackColor];
        bgImageView.alpha               = 0.7;
        bgImageView.layer.masksToBounds = YES;
        bgImageView.layer.cornerRadius  = 6.0f;        
        [self addSubview:bgImageView];
//        [bgImageView release];
        
        UILabel *titleLabel            = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        titleLabel.textColor           = [UIColor whiteColor];
        titleLabel.textAlignment       = NSTextAlignmentCenter;
        titleLabel.backgroundColor     = [UIColor clearColor];
        titleLabel.text                = title;
        titleLabel.lineBreakMode       = NSLineBreakByCharWrapping;
        titleLabel.numberOfLines       = 0;
        titleLabel.minimumScaleFactor  = 10.0f;
        titleLabel.font = [UIFont systemFontOfSize:12];
//        titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:titleLabel];
//        [titleLabel release];
        
        [self performSelector:@selector(disappear) withObject:nil afterDelay:1.7f];
    }
    return self;
}

- (void)disappear
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    self.alpha = 0.1f;
    [UIView setAnimationDidStopSelector:@selector(removeFromSuperview)];
    [UIView commitAnimations];
}


@end
