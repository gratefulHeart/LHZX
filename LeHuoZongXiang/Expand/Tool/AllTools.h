//
//  AllTools.h
//  ShangZnew
//
//  Created by HACK on 14-8-26.
//  Copyright (c) 2014年 up72. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CommonCrypto/CommonDigest.h>
//#import "RegexKitLite.h"
//#import "Reachability.h"

@interface AllTools : NSObject

//+(id)sharedInstance;

//+(UIImage *)gaussBlur:(CGFloat)blurLevel andImage:(UIImage *)orginImage;
//
//+(UIImage *)imageWithImageSimple:(UIImage *)image scaledToWidth:(CGFloat)newWidth;
//+(void)saveImage:(UIImage *)tempImage withName:(NSString *)imageName;
//+(void)savePhotoAlbum:(UIImage *)image;
//+(void)deleteFileFromPath:(NSString *)path;
//+(UIImage *)imageFromString:(NSString *)string inRect:(CGRect)rect;
////发送邮件
//+ (void)sendMail:(NSString *)mail;
////打电话
//+ (void)makePhoneCall:(NSString *)tel;
////发短信
//+ (void)sendSMS:(NSString *)tel;
////打开URL
//+ (void)openURLWithSafari:(NSString *)url;
////计算字符个数
//+ (int)countWords:(NSString *)s;
////屏幕截图，并保存到相册
//+ (void)saveImageFromToPhotosAlbum:(UIView *)view;
//- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
//
////获取文件夹大小
//+ (NSString *)getFolderSize:(long long)size;
//+ (long long)folderSizeAtPath:(NSString *)folderPath;
//+ (void)deleteAll:(NSString *)cachePath;
//
//
//// 当前时间戳
//+ (NSTimeInterval)formatTimeSinceNow:(NSTimeInterval)timestamp;
////根据timestamp来获取日期
//+ (NSString *)formatTime:(NSTimeInterval)timestamp formatWith:(NSString *)format;
////根据date来获取日期
//+ (NSString *)formatDate:(NSDate *)date formatWith:(NSString *)format;
////根据timestamp偏差来获取日期
//+ (NSString *)formatDateSinceNow:(NSTimeInterval)timestamp formatWith:(NSString *)format;
////获取时间差
//+ (NSString *)getTimeDiffString:(NSTimeInterval)timestamp;
//
////格式化时间 e.p “从 2013-8-12 至 2013-8-18 "
//+ (NSString *)getWeekKeyString:(NSTimeInterval)timestamp;
//+ (NSString *)getFirstDayForWeekKeyString:(NSTimeInterval)timestamp;
////格式化时间 e.p 2013-08
//+ (NSString *)getMonthKeyStringByOffset:(NSInteger)month;
//+ (NSInteger)getTotalDayInMonth:(NSTimeInterval)timestamp;
//
////获取本星期的第一天的timestamp
//+ (NSTimeInterval)getFirstDayOfWeek:(NSTimeInterval)timestamp;
////获取本月第一天的timestamp
//+ (NSTimeInterval)getFirstDayOfMonth:(NSTimeInterval)timestamp;
////获取上月第一天的timestamp
//+ (NSTimeInterval)getFirstDayOfLastMonth:(NSTimeInterval)timestamp;
////获取本季度第一天的timestamp
//+ (NSTimeInterval)getFirstDayOfQuarter:(NSTimeInterval)timestamp;
//
//
//
//
//
////传入的参数：1、生成图片的大小 2、压缩比 3、存放图片的路径
//
//+ (void)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent toPath:(NSString *)thumbPath;
//
////B，下面的这个方法适用于 对压缩后的图片的质量要求不高或者没有要求,因为这种方法只是压缩了图片的大小
//+(UIImage *)scale:(UIImage *)image toSize:(CGSize)size;
////压缩图片
//+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
//
//#pragma mark------加密
//+(NSString *) MD5: (NSString *)inputStr;
//+ (NSString* )SHA1:(NSString* )input;
//
//

/**
 *  json<--->nsarray,nsdictionary
 *
 *  @param jsonString <#jsonString description#>
 *
 *  @return <#return value description#>
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSString*)dictionaryToJson:(id)dic;



//类似Android的提示
+ (void)messageViewWithText:(NSString *)message;

//
//#pragma mark  邮箱密码手机号验证
//+(BOOL)emailVerification:(NSString *)string;
//+(BOOL)phoneVerification:(NSString *)string;
//+(BOOL)passwordVerification:(NSString *)string;
//
//#pragma mark 网络情况判断
//+ (BOOL)hostAvailable: (NSString *) theHost;
//+(BOOL)isEnable3G;
//+(BOOL)isEnableWIFI;
//
//
//
//#pragma mark other
//
//+ (UIImage *)cutImageFormImage:(UIImage *)image;
//
//
//+ (NSString *)fileDataPathWithFileFinder:(NSString *)finder andFileNamed:(NSString *)fileNamed;
//
//
//+ (CATransition *)setNavigationControllerAnimationDuration:(CGFloat)duration
//                                   animationTimingFunction:(NSString *)timingFunction
//                                             animationType:(NSString *)type
//                                          animationSubtype:(NSString *)subtype
//                                         animationDelegate:(id)delegate;
//
//
//
//+ (CGFloat)zoomScaleThatFitsTargetSize:(CGSize)target sourceSize:(CGSize)source;
//
//
//
//
//
////返回颜色值
//+(UIColor *)colorWith16Value:(NSString *)value;
//+(int)convertFrom16To10WithString:(NSString *)str;

#pragma mark UIColor 转UIImage
+ (UIImage*) createImageWithColor: (UIColor*) color;
#pragma mark 年级id获得年级字符串
+(NSString *)gradeToString:(NSString *)gradeId;
#pragma mark  截图
+ (UIImage *)snapshot:(UIView *)view;

#pragma mark  图片缩放 尺寸
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;


+(BOOL)validateNuneric:(NSString *)str2validate;

@end
