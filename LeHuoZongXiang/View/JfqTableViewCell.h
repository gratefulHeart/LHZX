//
//  JfqTableViewCell.h
//  LeHuoZongXiang
//
//  Created by FayuGuo on 15/10/8.
//  Copyright (c) 2015年 GFY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JfqTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *scoreL;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end
