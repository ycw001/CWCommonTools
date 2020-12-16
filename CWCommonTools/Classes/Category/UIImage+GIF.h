//
//  UIImage+GIF.h
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import <UIKit/UIKit.h>

typedef void(^GIFimageBlock)(UIImage *GIFImage);

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GIF)

/** 根据本地GIF图片名 获得GIF image对象 */
+ (UIImage *)imageWithGIFNamed:(NSString *)name;
 
/** 根据一个GIF图片的data数据 获得GIF image对象 */
+ (UIImage *)imageWithGIFData:(NSData *)data;
 
/** 根据一个GIF图片的URL 获得GIF image对象 */
+ (void)imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;

@end

NS_ASSUME_NONNULL_END
