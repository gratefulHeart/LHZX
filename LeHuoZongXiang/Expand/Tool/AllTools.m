//
//  AllTools.m
//  ShangZnew
//
//  Created by HACK on 14-8-26.
//  Copyright (c) 2014年 up72. All rights reserved.
//

#import "AllTools.h"
//#import<Accelerate/Accelerate.h>
//#include <sys/stat.h>
//#include <dirent.h>
//#include <sys/socket.h>
//#include <sys/sysctl.h>
//#import "MessageView.h"
#import "MessageView.h"
#import "NSDate+Category.h"

@implementation AllTools

//+(id)sharedInstance
//{
//    static dispatch_once_t pred;
//    static id shareIndstance = nil;
//    dispatch_once(&pred, ^{
//    
//        [[self alloc]init];
//    });
//    return shareIndstance;
//    
//}

//+(UIImage *)gaussBlur:(CGFloat)blurLevel andImage:(UIImage *)originImage
//{
//    blurLevel = MIN(1.0,MAX(0.0, blurLevel));
//    //int boxSize = (int)(blurLevel * 0.1 * MIN(self.size.width, self.size.height));
//    int boxSize = 50;//模糊度。
//    boxSize = boxSize - (boxSize % 2) + 1;
//    NSData *imageData = UIImageJPEGRepresentation(originImage, 1);
//    UIImage *tmpImage = [UIImage imageWithData:imageData];
//    CGImageRef img = tmpImage.CGImage;
//    vImage_Buffer inBuffer, outBuffer;
//    vImage_Error error;
//    void *pixelBuffer;
//    //create vImage_Buffer with data from CGImageRef
//    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
//    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
//    inBuffer.width = CGImageGetWidth(img);
//    inBuffer.height = CGImageGetHeight(img);
//    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
//    //create vImage_Buffer for output
//    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *CGImageGetHeight(img));
//    outBuffer.data = pixelBuffer;
//    outBuffer.width = CGImageGetWidth(img);
//    outBuffer.height = CGImageGetHeight(img);
//    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    NSInteger windowR = boxSize/2;
//    CGFloat sig2 = windowR / 3.0;
//    if(windowR>0){ sig2 = -1/(2*sig2*sig2); }
//    int16_t *kernel = (int16_t*)malloc(boxSize*sizeof(int16_t));
//    int32_t  sum = 0;
//    for(NSInteger i=0; i<boxSize; ++i){
//        kernel[i] = 255*exp(sig2*(i-windowR)*(i-windowR));
//        sum += kernel[i];
//    }
//    free(kernel);
//    // convolution
//    error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer,NULL, 0, 0, kernel, boxSize, 1, sum, NULL, kvImageEdgeExtend);
//    error = vImageConvolve_ARGB8888(&outBuffer, &inBuffer,NULL, 0, 0, kernel, 1, boxSize, sum, NULL, kvImageEdgeExtend);
//    outBuffer = inBuffer;
//    if (error) {
//        //NSLog(@"error from convolution %ld", error);
//    }
//    CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
//    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
//                                             outBuffer.width,
//                                             outBuffer.height,
//                                             8,
//                                             outBuffer.rowBytes,
//                                             colorSpace,
//                                             kCGBitmapAlphaInfoMask &kCGImageAlphaNoneSkipLast);
//    CGImageRef imageRef =CGBitmapContextCreateImage(ctx);
//    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
//    //clean up
//    CGContextRelease(ctx);
//    CGColorSpaceRelease(colorSpace);
//    free(pixelBuffer);
//    CFRelease(inBitmapData);
//    CGImageRelease(imageRef);
//    return returnImage;
//}
//
//+(UIImage *)imageWithImageSimple:(UIImage *)image scaledToWidth:(CGFloat)newWidth
//{
//    CGFloat newHeight = newWidth * image.size.height/image.size.width;
//    CGSize newSize = CGSizeMake(newWidth, newHeight);
//    // Create a graphics image context
//    UIGraphicsBeginImageContext(newSize);
//    // Tell the old image to draw in this new context, with the desired
//    // new size
//    
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    // Get the new image from the context
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    // End the context
//    UIGraphicsEndImageContext();
//    // Return the new image.
//    return newImage;
//
//}
//+(void)saveImage:(UIImage *)tempImage withName:(NSString *)imageName
//{
//    NSData* imageData = UIImagePNGRepresentation(tempImage);
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString* documentsDirectory = [paths objectAtIndex:0];
//    // Now we get the full path to the file
//    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
//    // and then we write it out
//    [imageData writeToFile:fullPathToFile atomically:NO];
//}
//+(void)savePhotoAlbum:(UIImage *)image
//{
//
//    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
//}
//+(void)deleteFileFromPath:(NSString *)path
//{
//    NSFileManager *defaultManager;
//    defaultManager = [NSFileManager defaultManager];
//    [defaultManager removeItemAtPath:path error:nil];
//
//}
//+(UIImage *)imageFromString:(NSString *)string inRect:(CGRect)rect
//{
//    UIImage *image = [UIImage imageWithContentsOfFile:string];
//    CGImageRef sourceImageRef = [image CGImage];
//    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
//    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
//    return newImage;
//
//}
//
//
//
//
//
//+ (void)sendMail:(NSString *)mail {
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mail]];
//}
//
//+ (void)makePhoneCall:(NSString *)tel {
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
//}
//
//+ (void)sendSMS:(NSString *)tel {
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
//}
//
//+ (void)openURLWithSafari:(NSString *)url {
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//}
//+ (int)countWords:(NSString *)s {
//	int i, n = (int)[s length], l = 0, a = 0, b = 0;
//	unichar c;
//	for (i = 0; i < n; i++) {
//		c = [s characterAtIndex:i];
//		if (isblank(c)) {
//			b++;
//		}
//		else if (isascii(c)) {
//			a++;
//		}
//		else {
//			l++;
//		}
//	}
//	if (a == 0 && l == 0) {
//		return 0;
//	}
//	return l + (int)ceilf((float)(a + b) / 2.0);
//}
//
//+ (UIImage *)saveImageFromView:(UIView *)view {
//	UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, view.layer.contentsScale);
//	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
//	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//	UIGraphicsEndImageContext();
//	return image;
//}
//
//+ (void)savePhotosAlbum:(UIImage *)image {
//	UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
//}
//
//+ (void)saveImageFromToPhotosAlbum:(UIView *)view {
//	UIImage *image = [self saveImageFromView:view];
//	[self savePhotosAlbum:image];
//}
//
//- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
//	NSString *message;
//	NSString *title;
//	if (!error) {
//		title = @"成功提示";
//		message = @"成功保存到相";
//	}
//	else {
//		title = @"失败提示";
//		message = [error description];
//	}
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//	                                                message:message
//	                                               delegate:nil
//	                                      cancelButtonTitle:@"知道了"
//	                                      otherButtonTitles:nil];
//	[alert show];
//}
//
//
//+ (NSString *)getFolderSize:(long long)size {
//	if (size < 1000) {
//		return [NSString stringWithFormat:@"%lldB", size];
//	}
//	else if (size < 1000 * 1000) {
//		return [NSString stringWithFormat:@"%.2fKB", size * 1.0 / 1000];
//	}
//	else if (size < 1000 * 1000 * 1000) {
//		return [NSString stringWithFormat:@"%.2fMB", size * 1.0 / 1000 / 1000];
//	}
//	else if (size < 1000.0 * 1000.0 * 1000.0 * 1000.0) {
//		return [NSString stringWithFormat:@"%.2fGB", size * 1.0 / 1000 / 1000 / 1000];
//	}
//	return @"";
//}
//
//+ (long long)folderSizeAtPath:(NSString *)folderPath {
//	return [self _folderSizeAtPath:[folderPath cStringUsingEncoding:NSUTF8StringEncoding]];
//}
//
//+ (long long)_folderSizeAtPath:(const char *)folderPath {
//	long long folderSize = 0;
//	DIR *dir = opendir(folderPath);
//	if (dir == NULL) return 0;
//	struct dirent *child;
//	while ((child = readdir(dir)) != NULL) {
//		if (child->d_type == DT_DIR && (
//                                        (child->d_name[0] == '.' && child->d_name[1] == 0) ||                         // 忽略目录 .
//                                        (child->d_name[0] == '.' && child->d_name[1] == '.' && child->d_name[2] == 0)                         // 忽略目录 ..
//                                        )) continue;
//        
//		NSUInteger folderPathLength = strlen(folderPath);
//		char childPath[1024]; // 子文件的路径地址
//		stpcpy(childPath, folderPath);
//		if (folderPath[folderPathLength - 1] != '/') {
//			childPath[folderPathLength] = '/';
//			folderPathLength++;
//		}
//		stpcpy(childPath + folderPathLength, child->d_name);
//		childPath[folderPathLength + child->d_namlen] = 0;
//		if (child->d_type == DT_DIR) { // directory
//			folderSize += [self _folderSizeAtPath:childPath]; // 递归调用子目录
//			// 把目录本身所占的空间也加上
//			struct stat st;
//			if (lstat(childPath, &st) == 0) folderSize += st.st_size;
//		}
//		else if (child->d_type == DT_REG || child->d_type == DT_LNK) { // file or link
//			struct stat st;
//			if (lstat(childPath, &st) == 0) folderSize += st.st_size;
//		}
//	}
//	return folderSize;
//}
//
//+ (void)deleteAll:(NSString *)cachePath {
//	[[NSFileManager defaultManager] removeItemAtPath:cachePath error:NULL];
//	[[NSFileManager defaultManager] createDirectoryAtPath:cachePath
//	                          withIntermediateDirectories:YES
//	                                           attributes:nil
//	                                                error:NULL];
//}
//+ (NSString *)getTimeDiffString:(NSTimeInterval)timestamp {
//	timestamp = timestamp / 1000.0f;
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDate *todate = [NSDate dateWithTimeIntervalSince1970:timestamp];
//	NSDate *today = [NSDate date]; //当前时间
//	unsigned int unitFlag = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
//	NSDateComponents *gap = [cal components:unitFlag fromDate:today toDate:todate options:0]; //计算时间差
//    
//	if (ABS([gap day]) > 0) {
//		return [NSString stringWithFormat:@"%ld天前", (long)(ABS([gap day]))];
//	}
//	else if (ABS([gap hour]) > 0) {
//		return [NSString stringWithFormat:@"%ld小时前", (long)(ABS([gap hour]))];
//	}
//	else {
//		return [NSString stringWithFormat:@"%ld分钟前",  (long)(ABS([gap minute]))];
//	}
//}
//+(NSTimeInterval)formatTimeSinceNow:(NSTimeInterval)timestamp{
//    NSDate *time = [NSDate dateWithTimeIntervalSinceNow:timestamp];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:@"yyy-MM-dd"];
//	NSString *thisDayMin = [dateFormatter stringFromDate:time];
//    
//    return [[dateFormatter dateFromString:thisDayMin] timeIntervalSince1970];
//}
//
//+ (NSString *)formatDateSinceNow:(NSTimeInterval)timestamp formatWith:(NSString *)format{
//    NSDate *time = [NSDate dateWithTimeIntervalSinceNow:timestamp];
//    return [self formatDate:time formatWith:format];
//}
//
//+ (NSString *)formatTime:(NSTimeInterval)timestamp formatWith:(NSString *)format{
//    
//    NSLog(@"timestamp==%f",timestamp);
//
//    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timestamp];
//    if(time == 0){
//        return @"";
//    }else{
//        
//        return [self formatDate:time formatWith:format];
//    }
//}
//
////format :yyyy-MM-dd
//+ (NSString *)formatDate:(NSDate *)date formatWith:(NSString *)format{
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:format];
//	NSString *currentDateStr = [dateFormatter stringFromDate:date];
//    
//    NSLog(@"currentDateStr==%@ date== %@",currentDateStr,date);
//	return currentDateStr;
//}
//
///**
// *	获取时间的key 按星期  e.q "从 2013-08-05 至 2013-08-11"
// *
// *	@param	timestamp
// *
// *	@return
// */
//+ (NSString *)getWeekKeyString:(NSTimeInterval)timestamp {
//	NSTimeInterval timestampStart = [self getFirstDayOfWeek:timestamp];
//	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestampStart];
//	NSString *timeStart = [self formatDate:date formatWith:@"yyyy-MM-dd"];
//    
//	NSString *timeEnd = [self formatDate:[date dateByAddingTimeInterval:3600 * 24 * 6] formatWith:@"yyyy-MM-dd"];
//    
//	return [NSString stringWithFormat:@"From %@ to %@", timeStart, timeEnd];
//}
//
//+ (NSString *)getFirstDayForWeekKeyString:(NSTimeInterval)timestamp {
//	NSTimeInterval timestampStart = [self getFirstDayOfWeek:timestamp];
//	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestampStart];
//	NSString *timeStart = [self formatDate:date formatWith:@"yyyy-MM-dd"];
//    
//	return timeStart;
//}
//
//+ (NSString *)getMonthKeyStringByOffset:(NSInteger)month {
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDateComponents *comps = [cal
//	                           components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
//                               fromDate:[NSDate date]];
//    
//	comps.month = comps.month + month;
//	if (comps.month > 12) {
//		comps.year = comps.year + 1;
//		comps.month =  comps.month - 12;
//	}
//	else if (comps.month < 1) {
//		comps.year = comps.year - 1;
//		comps.month = comps.month + 12;
//	}
//    
//	NSDate *date = [cal dateFromComponents:comps];
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:@"yyyy-MM"];
//	NSString *currentDateStr = [dateFormatter stringFromDate:date];
//	return currentDateStr;
//}
//
//+ (NSInteger)getTotalDayInMonth:(NSTimeInterval)timestamp{
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
//    return range.length;
//}
//
//
//+ (NSTimeInterval)getFirstDayOfQuarter:(NSTimeInterval)timestamp {
//	NSDate *now = [NSDate dateWithTimeIntervalSince1970:timestamp];
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDateComponents *comps = [cal
//	                           components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
//                               fromDate:now];
//	if (comps.month <= 3) {
//		comps.month =  1;
//	}
//	else if (comps.month <= 6) {
//		comps.month =  4;
//	}
//	else if (comps.month <= 9) {
//		comps.month =  7;
//	}
//	else if (comps.month <= 12) {
//		comps.month =  10;
//	}
//    
//	comps.day = 1;
//	NSDate *firstDay = [cal dateFromComponents:comps];
//	return [firstDay timeIntervalSince1970];
//}
//
//+ (NSTimeInterval)getFirstDayOfWeek:(NSTimeInterval)timestamp {
//	NSDate *now = [NSDate dateWithTimeIntervalSince1970:timestamp];
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDateComponents *comps = [cal
//	                           components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit
//                               fromDate:now];
//	NSLog(@"%ld,%ld,%ld,%ld", (long)comps.year, (long)comps.month, (long)comps.week, (long)comps.weekday);
//	if (comps.weekday < 2) {
//		comps.week = comps.week - 1;
//	}
//	comps.weekday = 2;
//	//   NSLog(@"%d,%d,%d,%d",comps.year,comps.month,comps.week,comps.weekday);
//	NSDate *firstDay = [cal dateFromComponents:comps];
//	return [firstDay timeIntervalSince1970];
//}
//
//
//+ (NSTimeInterval)getFirstDayOfMonth:(NSTimeInterval)timestamp {
//	NSDate *now = [NSDate dateWithTimeIntervalSince1970:timestamp];
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDateComponents *comps = [cal
//	                           components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
//                               fromDate:now];
//	comps.day = 1;
//	NSDate *firstDay = [cal dateFromComponents:comps];
//	return [firstDay timeIntervalSince1970];
//}
//
//+ (NSTimeInterval)getFirstDayOfLastMonth:(NSTimeInterval)timestamp{
//	NSDate *now = [NSDate dateWithTimeIntervalSince1970:timestamp];
//	NSCalendar *cal = [NSCalendar currentCalendar];
//	NSDateComponents *comps = [cal
//	                           components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
//                               fromDate:now];
//    if(comps.month - 1 == 0 ){
//        comps.month = 12;
//        comps.year = comps.year -1;
//    }else{
//        comps.month = comps.month - 1;
//    }
//	comps.day = 1;
//	NSDate *firstDay = [cal dateFromComponents:comps];
//	return [firstDay timeIntervalSince1970];
//}
//
////A，//传入的参数：1、生成图片的大小 2、压缩比 3、存放图片的路径
//+ (void)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent toPath:(NSString *)thumbPath{
//    CGSize imageSize = image.size;
//    CGFloat width = imageSize.width;
//    CGFloat height = imageSize.height;
//    CGFloat scaleFactor = 0.0;
//    CGPoint thumbPoint = CGPointMake(0.0,0.0);
//    CGFloat widthFactor = thumbSize.width / width;
//    CGFloat heightFactor = thumbSize.height / height;
//    if (widthFactor > heightFactor)  {
//        scaleFactor = widthFactor;
//    }
//    else {
//        scaleFactor = heightFactor;
//    }
//    CGFloat scaledWidth  = width * scaleFactor;
//    CGFloat scaledHeight = height * scaleFactor;
//    if (widthFactor > heightFactor)
//    {
//        thumbPoint.y = (thumbSize.height - scaledHeight) * 0.5;
//    }
//    else if (widthFactor < heightFactor)
//    {
//        thumbPoint.x = (thumbSize.width - scaledWidth) * 0.5;
//    }
//    UIGraphicsBeginImageContext(thumbSize);
//    CGRect thumbRect = CGRectZero;
//    thumbRect.origin = thumbPoint;
//    thumbRect.size.width  = scaledWidth;
//    thumbRect.size.height = scaledHeight;
//    [image drawInRect:thumbRect];
//    
//    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    NSData *thumbImageData = UIImageJPEGRepresentation(thumbImage, percent);
//    [thumbImageData writeToFile:thumbPath atomically:NO];
//}
////B，下面的这个方法适用于 对压缩后的图片的质量要求不高或者没有要求,因为这种方法只是压缩了图片的大小
//+(UIImage *)scale:(UIImage *)image toSize:(CGSize)size
//{
//    UIGraphicsBeginImageContext(size);
//    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return scaledImage;
//}
//
////压缩图片
//+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
//{
//    // Create a graphics image context
//    UIGraphicsBeginImageContext(newSize);
//    // Tell the old image to draw in this new context, with the desired
//    // new size
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    // Get the new image from the context
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    // End the context
//    UIGraphicsEndImageContext();
//    // Return the new image.
//    return newImage;
//}
//
//
//#pragma mark------加密
////MD5加密
//+(NSString *) MD5: (NSString *)inputStr
//{
//    const char *cStr = [inputStr UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(cStr, strlen(cStr), result);
//    
//    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//             result[0], result[1], result[2], result[3],
//             result[4], result[5], result[6], result[7],
//             result[8], result[9], result[10], result[11],
//             result[12], result[13], result[14], result[15]
//             ] lowercaseString];
//}
//
//
////SHA1加密
//+ (NSString* )SHA1:(NSString* )input
//{
//    NSData *data = [input dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1(data.bytes, data.length, digest);
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    
//    return output;
//}




+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
    }
    
    
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSError *err;
//    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&err];
    
//    if(err) {
//        
//        NSLog(@"json解析失败：%@",err);
//        
//        return dic;
//        
//    }
    
    return dict;
    
}



+ (NSString*)dictionaryToJson:(id)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString  *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}




+ (void)messageViewWithText:(NSString *)message
{
    
    if ([message isKindOfClass:[NSNull class]]) {
        message = @"返回为null";
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    NSMutableDictionary *attriDict = [NSMutableDictionary dictionary];
    [attriDict setObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    
    CGRect rect = [message boundingRectWithSize:CGSizeMake(150, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attriDict context:nil];
    
    CGSize size = rect.size;//[message sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(150, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
    
    if (![keyWindow viewWithTag:123])
    {
        MessageView *messge = [[MessageView alloc] initWithFrame:CGRectMake(0, 0, 150, size.height+20) andText:message];
        messge.tag = 123;
        [keyWindow addSubview:messge];
        [keyWindow bringSubviewToFront:messge];
//        [messge    release];
    }
}
//#pragma mark  邮箱密码手机号验证
//
//+(BOOL)emailVerification:(NSString *)string
//{
//    if ([string isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"]) {
//        return YES;
//    }
//    return NO;
//    
//}
//+(BOOL)phoneVerification:(NSString *)string
//{
//    if ([string isMatchedByRegex:@"^[0-9-]{6,18}$"]) {
//        return YES;
//    }
//    return NO;
//}
//+(BOOL)passwordVerification:(NSString *)string
//{
//    if ([string isMatchedByRegex:@"^[A-Za-z0-9_]{3,12}$"]) {
//        return  YES;
//    }
//    return NO;
//}
//#pragma mark 网络情况判断
//+ (BOOL)hostAvailable: (NSString *) theHost
//{
//
//    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    switch ([reach currentReachabilityStatus]) {
//        case NotReachable:
//            return NO;
//            break;
//        case ReachableViaWWAN:
//            return YES;
//            break;
//        case ReachableViaWiFi:
//            return YES;
//            break;
//        default:
//            break;
//    }
//    return YES;
//    
//}
//+(BOOL)isEnableWIFI
//{
//
//    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]!=NotReachable);
//}
//+(BOOL)isEnable3G
//{
//   return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
//}
//
//
//
//
//#pragma mark other
//
//+ (UIImage *)cutImageFormImage:(UIImage *)image
//{
//
//    NSInteger width = MIN((int)image.size.width, (int)image.size.height);
//    
//    CGFloat x = 0;
//    CGFloat y = 0;
//    
//    if (width == image.size.width)
//    {
//        y = (image.size.height - width)/2.0f;
//    }
//    else if (width == image.size.height)
//    {
//        x = (image.size.width - width)/2.0f;
//    }
//    
//    CGImageRef sourceImageRef = [image CGImage];
//    CGImageRef newImageRef    = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(x, y, width, width));
//    UIImage *resultImage      = [UIImage imageWithCGImage:newImageRef];
//    CGImageRelease(newImageRef);
//    return resultImage;
// 
//}
//
//
//+ (NSString *)fileDataPathWithFileFinder:(NSString *)finder andFileNamed:(NSString *)fileNamed
//{
//
//    if (!finder || [finder isKindOfClass:[NSNull class]])
//    {
//        finder = @"";
//    }
//    
//    
//    
//    NSString *stringPath ;//= [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"WelcomeImages.bundle"];
//    
//    if([UIScreen mainScreen].bounds.size.height==480)
//    {
//        stringPath = [AllTools fileDataPathWithFileFinder:@"WelcomeImages.bundle/iPhone4" andFileNamed:nil];
//        
//    }
//    else if([UIScreen mainScreen].bounds.size.height == 568)
//    {
//        stringPath = [AllTools fileDataPathWithFileFinder:@"WelcomeImages.bundle/iPhone5" andFileNamed:nil];
//    }
//    
//    return stringPath;
//    
////    UserInfo *info = [UserInfo standardUserInfo];
//    
//    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/%@%@",finder, @""];
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    if (![fileManager fileExistsAtPath:filePath])
//    {
//        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    
//    return [filePath stringByAppendingPathComponent:fileNamed];
//
//}
//
//
//+ (CATransition *)setNavigationControllerAnimationDuration:(CGFloat)duration
//                                   animationTimingFunction:(NSString *)timingFunction
//                                             animationType:(NSString *)type
//                                          animationSubtype:(NSString *)subtype
//                                         animationDelegate:(id)delegate
//{
//
//    CATransition *transition = [CATransition animation];
//    
//    transition.duration = duration;
//    
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
//    
//    transition.type = type;
//    
//    transition.subtype = subtype;
//    
//    transition.delegate = delegate;
//    
//    return transition;
//
//}
//
//
//
//+ (CGFloat)zoomScaleThatFitsTargetSize:(CGSize)target sourceSize:(CGSize)source
//{
//
//    CGFloat w_scale = (target.width / source.width);
//	CGFloat h_scale = (target.height / source.height);
//    
//	return ((w_scale < h_scale) ? w_scale : h_scale);
//
//}
//
////返回颜色值
//+(UIColor *)colorWith16Value:(NSString *)value
//{
//
//    NSString *str = [value  substringFromIndex:1];
//    
//    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
//    
//    
//    for(int i = 0;i<[str length];i=i+2)
//    {
//        NSString *string = [str substringWithRange:NSMakeRange(i, 2)];
//        [arr addObject:string];
//    }
//    
//    
////    NSMutableArray *arrrValue = [NSMutableArray array];
//    
//    int  redV = 0;
//    int  greenV = 0;
//    int  blueV  = 0 ;
//    
//    
//    for(int i = 0;i<[arr count];i++)
//    {
//        NSString *va = [arr objectAtIndex:i];
//        
//        int  num = [AllTools convertFrom16To10WithString:va];
//
//        (i==0)?(redV = num):((i==1)?(greenV = num):(blueV = num)
//                             );
//        
//    }
//    
//    NSLog(@"R=%dG=%dB=%d",redV,greenV,blueV);
//    
//    return [UIColor colorWithRed:redV/255.0 green:greenV/255.0 blue:blueV/255.0 alpha:1];
//    
//}
//
//+(int)convertFrom16To10WithString:(NSString *)str
//{
//    int num = 0;
//    
//    for(int j=0;j<[str length];j++)
//    {
//        
//        NSRange rage = NSMakeRange(j, 1);
//        NSString *ke = [str substringWithRange:rage];
//        
//        if([ke isEqualToString:@"0"])
//        {
//
//            num = num +0*((j==0)?10:1);
//            
//        }
//        else if ([ke isEqualToString:@"1"])
//        {
//            num = num +1*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"2"])
//        {
//            num = num +2*((j==0)?10:1);
//
//        }
//
//        else if ([ke isEqualToString:@"3"])
//        {
//            num = num +3*((j==0)?10:1);
//
//        }
//
//        else if ([ke isEqualToString:@"4"])
//        {
//            num = num +4*((j==0)?10:1);
//
//        }
//
//        else if ([ke isEqualToString:@"5"])
//        {
//            num = num +5*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"6"])
//        {
//            num = num +6*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"7"])
//        {
//            num = num +7*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"8"])
//        {
//            num = num +8*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"9"])
//        {
//            num = num +9*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"A"]||[ke isEqualToString:@"a"])
//        {
//            num = num +10*((j==0)?10:1);
// 
//        }
//        else if ([ke isEqualToString:@"B"]||[ke isEqualToString:@"b"])
//        {
//            num = num +11*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"C"]||[ke isEqualToString:@"c"])
//        {
//            num = num +12*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"D"]||[ke isEqualToString:@"d"])
//        {
//            num = num +13*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"E"]||[ke isEqualToString:@"e"])
//        {
//            num = num +14*((j==0)?10:1);
//
//        }
//        else if ([ke isEqualToString:@"F"]||[ke isEqualToString:@"f"])
//        {
//            num = num +15*((j==0)?10:1);
//
//        }
//
//        
//        
//    }
//
//    
//    return num;
//}




//UIColor 转UIImage
+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 30, 30);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
+(NSString *)gradeToString:(NSString *)gradeId
{
    
    switch ([gradeId integerValue]) {
        case 1:
        {
            return @"小一";
        }
            break;
        case 2:
        {
            return @"小二";
        }
            break;
        case 3:
        {
            return @"小三";
        }
            break;
        case 4:
        {
            return @"小四";
        }
            break;
        case 5:
        {
            return @"小五";
        }
            break;
        case 6:
        {
            return @"小六";
        }
            break;
        case 7:
        {
            return @"初一";
        }
            break;
        case 8:
        {
            return @"初二";
        }
            break;
        case 9:
        {
            return @"初三";
        }
            break;
        case 10:
        {
            return @"高一";
        }
            break;
        case 11:
        {
            return @"高二";
        }
            break;
        case 12:
        {
            return @"高三";
        }
            break;
        default:
            return @"无对应年级";
            break;
    }
    
    return @"无对应年级";
}
+ (UIImage *)snapshot:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}


+(BOOL)validateNuneric:(NSString *)str2validate
{

    NSCharacterSet *charSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange range = [str2validate rangeOfCharacterFromSet:charSet];
    return (range.location == NSNotFound) ? YES : NO;
}


@end
