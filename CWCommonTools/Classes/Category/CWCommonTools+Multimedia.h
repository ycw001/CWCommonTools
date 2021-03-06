//
//  CWCommonTools+Multimedia.h
//  CWCommonTools
//
//  Created by CW on 2020/12/16.
//

#import "CWBaseCommonTools.h"
#import <UIKit/UIkit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWCommonTools (Multimedia)

#pragma mark -
#pragma mark - 图像视频处理类

///将UIImage内容写入本地保存，重新命名，返回保存过的路径
//Write the UIImage content to local save, rename, and return the saved path
- (NSString *)saveImage:(id)img withFileName:(NSString *)fileName;

///压缩一张图片并返回
//Compress a picture and return
- (UIImage *)compressImage:(UIImage *)img withQuality:(float)quality;

///图片压缩数组，返回压缩过的图片数组
//The picture compresses the array, returns the compressed array of pictures
- (NSArray *)compressImageArray:(NSArray *)imgArray withQuality:(float)quality;


/**
 从视频中截取某一帧  Intercept a frame from the video
 @param videoLocalPath 视频的本地地址 The local address of the video
 @param frametime 截取第几秒的一帧  Intercepting a frame of a second
 @return 返回截图 Return screenshot
 */
- (UIImage *)getVideoPreViewImageWithVideoLocalPath:(NSString *)videoLocalPath withFrametime:(float)frametime;

///获取本地视频的时长
//Get the length of the local video
- (NSUInteger)getDurationWithVideoLocalPath:(NSString *)videoLocalPath;

///获取视频的分辨率
//Obtaining the resolution of video
- (CGSize)getSizeOfVideoAsset:(AVAsset *)videoAsset;

///播放音效，是否震动
//Play sound effects, set up vibration
- (void)playEffectWithLocalFilePath:(NSString *)effectLocalFilePath withShake:(BOOL)shake;

/**
 播放音乐 Play music
 @param musicPath 音乐的地址,可以是本地地址，也可以是网络地址 The address of the music，available with localFilePath and network address
@param repeat 是否循环播放 should play music repeat
 */
- (AVAudioPlayer *)playMusicWithMusicFilePath:(NSString *)musicPath withRepeat:(BOOL)repeat;

//播放音乐，可以设置播放的模式
- (AVAudioPlayer *)playMusicWithMusicFilePath:(NSString *)musicPath withRepeat:(BOOL)repeat withCategory:(AVAudioSessionCategory)audioSessionCategory;

//停止音乐播放 Stop playing music
- (void)stopMusic;

//开始震动，是否持续震动
- (void)startVibrateWithRepeat:(BOOL)repeat;

//结束震动
- (void)stopVibrate;

@end

NS_ASSUME_NONNULL_END
