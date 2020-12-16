//
//  CWCommonTools+SystemInfo.h
//  CWCommonTools
//
//  Created by CW on 2020/12/16.
//

#import "CWBaseCommonTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWCommonTools (SystemInfo)

#pragma mark -
#pragma mark - 系统信息类
///软件版本
//the AppVersion
- (NSString *)getAppVersionStr;

///工程的build版本
//The build version of the project
- (NSString *)getAppBuildVersionStr;

///系统的ios版本
//The IOS version of the system
- (NSString *)getIOSVersionStr;

///获取系统语言
//Get the system language
- (NSString *)getIOSLanguageStr;

///是否是英文语言环境
//Is it an English language environment
- (BOOL)isEnglishLanguage;

///返回系统使用语言
//Return to the system usage language
- (CWSystemLanguage)getLanguage;

///软件Bundle Identifier
//Software Bundle Identifier
- (NSString *)getBundleIdentifier;

///设备的唯一表示（一定会获取到，根据keychain里面的数据计算而来，会跟着icloud一起走）:
//The unique representation of the device (which is bound to get, based on the data inside the Keychain, to follow the icloud)
- (NSString *)getIphoneUdid;

/// 获取设备的idfa
//The only indication of the simulation software.If IDFA is available, it will return to IDFA.Otherwise, use the analog IDFA
- (NSString *)getDeviceIDFA;

///获取手机WIFI的MAC地址，需要开启Access WiFi information
- (NSString *)getMacAddress;

///获取具体的手机型号字符串
//Get a specific handset model string
- (NSString *)getDetailModelStr;

///是否是平板
//Whether is ipad
- (BOOL)isPad;

///是否是iphoneX
//Whether is iphoneX
- (BOOL)isPhoneX;

@end

NS_ASSUME_NONNULL_END
