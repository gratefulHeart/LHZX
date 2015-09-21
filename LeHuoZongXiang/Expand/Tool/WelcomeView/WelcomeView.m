//
//  WelcomeView.m
//  iMobbyMobile
//
//  Created by up72 on 13-7-17.
//  Copyright (c) 2013年 up72. All rights reserved.
//

#import "WelcomeView.h"

@implementation WelcomeView
@synthesize wDelete;
@synthesize pageCount;


- (id)initWithOldFrame:(CGRect)frame finder:(NSString *)finder
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.delegate = self;
        self.backgroundColor = [UIColor blackColor];
        NSArray *fileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:finder error:nil];
//        NSLog(@"fileArray count= %d",[fileArray count]);
        NSInteger count = 0;
        
        if ([fileArray count] > 0)
        {
            for (NSInteger i = 0; i < [fileArray count]/2; i ++)
            {
                count = i;
                NSString *named = [fileArray objectAtIndex:i*2];
//                NSString *name = [NSString stringWithFormat:@"Welcome0_%d",i+1];
//                [self addSubImageview:LOADIMAGE(name, @"png") anIndex:i];
//                NSLog(@"111111111111111111111111111");
                [self addSubImageview:LOAD_DOCUMENT_IMAGE([finder stringByAppendingPathComponent:named])
                              anIndex:i];
            }
        }
        else
        {
            for (NSInteger i = 0; i < 3; i ++)
            {
                count = i;
                
                NSInteger temp = 0;
                
//                if (iPhone5)
//                {
//                    temp = 1;
//                }
                
                NSString *name = [NSString stringWithFormat:@"Welcome%d_%d@2x",temp,i + 1];
                [self addSubImageview:LOADIMAGE(name, @"png") anIndex:i];
            }
        }
        
        self.pageCount = count;
        
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(82, 459, 250, 45)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(260+SCREEN_WIDTH*count, 861, 250, 45);
        [button setBackgroundColor:CLEARCOLOR];

        [button addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
//        button.center = CGPointMake(frame.size.width*(count + 1) - frame.size.width/2, frame.size.height - 35);
        [self addSubview:button];
        
        
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(frame.size.width*(count + 1), frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        
        CGRect pageFrame = button.frame;
        pageFrame.origin.x = 0;
        pageFrame.size.width = frame.size.width;

    }
    return self;
}
- (id)initWithFrame:(CGRect)frame finder:(NSString *)finder
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delegate = self;
        self.backgroundColor = [UIColor blackColor];

        NSInteger count = 2;
        
        
        for (int i = 0; i<count; i++) {
            
            NSString *imgName = @"";
            
            if(iPhone4){
                imgName = [NSString stringWithFormat:@"huanying%d_4",i+1];
            }
            else if (iPhone5){
                imgName = [NSString stringWithFormat:@"huanying%d_5",i+1];
            }
            else if (iPhone6||iPhone6Plus){
                imgName = [NSString stringWithFormat:@"huanying%d_6",i+1];
            }
            
            [self addSubImageview:LOADIMAGE(imgName, @"png") anIndex:i];

        }
        
        self.pageCount = count;
        
        //        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(82, 459, 250, 45)];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SCREEN_WIDTH*(count-1)+(SCREEN_WIDTH-180)/2.0, SCREEN_HEIGHT-180, 180, 62);
//        [button setBackgroundColor:CLEARCOLOR];
        [button setBackgroundImage:LOADIMAGE(@"WelcomeStart1@2x", @"png") forState:UIControlStateNormal];
        [button setBackgroundImage:LOADIMAGE(@"WelcomeStart0@2x", @"png") forState:UIControlStateHighlighted];

        [button addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
        //        button.center = CGPointMake(frame.size.width*(count + 1) - frame.size.width/2, frame.size.height - 35);
        [self addSubview:button];
        
        
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(frame.size.width*count, frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        
        CGRect pageFrame = button.frame;
        pageFrame.origin.x = 0;
        pageFrame.size.width = frame.size.width;
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([wDelete respondsToSelector:@selector(welcomeViewDidScroll:)])
    {
        [wDelete welcomeViewDidScroll:self];
    }
}

- (void)remove
{
//    self.backgroundColor = [UIColor clearColor];
    if ([wDelete respondsToSelector:@selector(welcomeViewRemove:)])
    {
        [wDelete welcomeViewRemove:self];
    }
    
    
}
- (CGFloat)zoomScaleThatFitsTargetSize:(CGSize)target sourceSize:(CGSize)source
{
    CGFloat w_scale = (target.width / source.width);
    CGFloat h_scale = (target.height / source.height);
    
    return ((w_scale < h_scale) ? w_scale : h_scale);
}
- (void)addSubImageview:(UIImage *)image anIndex:(NSInteger)index
{
    if (!image)
    {
        return;
    }
    
    CGFloat scale  = [self zoomScaleThatFitsTargetSize:self.frame.size sourceSize:image.size];//[MTool zoomScaleThatFitsTargetSize:self.frame.size sourceSize:image.size];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           image.size.width * scale,
                                                                           image.size.height * scale)];
    imageView.center = CGPointMake(self.frame.size.width/2 + self.frame.size.width*index,
                                   self.frame.size.height/2);
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    [self addSubview:imageView];
//    [imageView release];
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
