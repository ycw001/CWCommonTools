//
//  CWCommonToolsConfig.h
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#ifndef CWCommonToolsConfig_h
#define CWCommonToolsConfig_h

///申请的权限 Application authority
typedef NS_ENUM(NSUInteger, CWPrivatePermissionName) {
    kCWPermissionNameAudio,     //麦克风权限 Microphone permissions
    kCWPermissionNameVideo,     //摄像头权限 Camera permissions
    kCWPermissionNamePhotoLib,  //相册权限 Photo album permissions
    kCWPermissionNameGPS,       //GPS权限 GPS permissions
    kCWPermissionNameNotification, //通知权限 Notification permissions
};

///申请权限状态 Application permissions status
typedef NS_ENUM(NSUInteger, CWPrivatePermissionStatus) {
    kCWAuthorized = 1,  //用户允许 Authorized
    kCWAuthorRestricted,//被限制修改不了状态,比如家长控制选项等 Restricted status, such as parental control options, etc.
    kCWDenied,          //用户拒绝 Denied
    kCWNotDetermined    //用户尚未选择 NotDetermined
};

///申请定位权限的类型 The type of application for positioning permission
typedef NS_ENUM(NSUInteger, CWGPSPermissionType) {
    kCWGPSPermissionWhenInUse,      //申请使用期间访问位置 Access location WhenInUse
    kCWGPSPermissionAlways,         //申请一直访问位置  Always
    kCWGPSPermissionBoth            //两者都申请 Both
};

///常用的系统语言 Common system language
typedef NS_ENUM(NSUInteger, CWSystemLanguage) {
    kCWLanguageEn = 1,  //英文 English
    kCWLanguageTC,      //繁体中文 Traditional Chinese
    kCWLanguageCN,       //简体 Simplified Chinese
    kCWLanguageOther     //其他语言 Other languages
};

///时间戳快速转换为时间字符串 The time stamp is quickly converted to a time string
typedef NS_ENUM(NSUInteger, CWQuickFormatType) {
    kCWQuickFormateTypeYMD,         //年月日   2010-09-02
    kCWQuickFormateTypeMD,          //月日     09-02
    kCWQuickFormateTypeYMDTime,     //年月日时间 2010-09-02 05:23:17
    kCWQuickFormateTypeTime,        //时间    05:23:17
    kCWQuickFormateTypeMDTime,       //月日时间 09-02 05:23
    kCWQuickFormateTypeYMDTimeZone    //年月日时区 2018-03-15T09:59:00+0800
};

///
typedef NS_ENUM(NSUInteger, CWChineseLunarCalendarFormatType) {
    kCWChineseLunarCalendarFormatTypeYMD,         //年月日   2018年正月初十
    kCWChineseLunarCalendarFormatTypeMD,          //月日     正月初十
};

///评分样式类型 Scoring style type
typedef NS_ENUM(NSUInteger, CWScoreType) {
    kCWScoreTypeInAppStore,  //强制跳转到appsStore中评分。 Forced jump to appsStore
    kCWScoreTypeInApp,      //强制在app中弹出评分弹窗，ios10.3版本以下无反应。 Force the score pop-up window in app, the score will not respond when lower than the ios10.3 version
    kCWScoreTypeAuto         //10.3版本以下去appStore评分，10.3版本以上在app中弹出评分弹窗。jump to appsStore when lower than the ios10.3 version and the score pop-up window in app when higher than the ios10.3 version
};

///打开指定软件的appstore样式类型 Open the Appstore style type of the specified software
typedef NS_ENUM(NSUInteger, CWJumpStoreType) {
    kCWJumpStoreTypeInAppStore,  //强制跳转到appsStore。 Forced jump to appsStore
    kCWJumpStoreTypeInApp,      //强制在app中弹出appStore，ios10.3版本以下无反应。Force the score pop-up window in app, the score will not respond when lower than the ios10.3 version
    kCWJumpStoreTypeAuto         //10.3版本以下跳转appStore，10.3版本以上在app中弹出Appstore。jump to appsStore when lower than the ios10.3 version and the score pop-up window in app when higher than the ios10.3 version
};

///星座 Constellation
typedef NS_ENUM(NSUInteger, CWConstellation) {
    kCWConstellationCapricorn,      //摩羯座
    kCWConstellationAquarius,       //水瓶座
    kCWConstellationPisces,         //双鱼座
    kCWConstellationAries,          //白羊座
    kCWConstellationTaurus,         //金牛座
    kCWConstellationGemini,         //双子座
    kCWConstellationCancer,         //巨蟹座
    kCWConstellationLeo,            //狮子座
    kCWConstellationVirgo,          //处女座
    kCWConstellationLibra,          //天秤座
    kCWConstellationScorpio,        //天蝎座
    kCWConstellationSagittarius     //射手座
};

///十二生肖 Chinese Zodiac
typedef NS_ENUM(NSUInteger, CWChineseZodiac) {
    kCWChineseZodiacRat = 1,        //子鼠
    kCWChineseZodiacOx,         //丑牛
    kCWChineseZodiacTiger,      //寅虎
    kCWChineseZodiacRabbit,     //卯兔
    kCWChineseZodiacDragon,     //辰龙
    kCWChineseZodiacSnake,      //巳蛇
    kCWChineseZodiacHorse,      //午马
    kCWChineseZodiacGoat,       //未羊
    kCWChineseZodiacMonkey,     //申猴
    kCWChineseZodiacRooster,    //酉鸡
    kCWChineseZodiacDog,        //戌狗
    kCWChineseZodiacPig,        //亥猪
};

#endif /* CWCommonToolsConfig_h */
