//
//  CalenderConverter.h
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Lunar : NSObject
/**
 *是否闰月
 */
@property (assign,nonatomic) BOOL isleap;
/**
 *农历 日
 */
@property (assign,nonatomic) int lunarDay;
/**
 *农历 月
 */
@property (assign,nonatomic) int lunarMonth;
/**
 *农历 年
 */
@property (assign,nonatomic) int lunarYear;

@end

@interface Solar : NSObject
/**
 *公历 日
 */
@property (assign,nonatomic) int solarDay;
/**
 *公历 月
 */
@property (assign,nonatomic) int solarMonth;
/**
 *公历 年
 */
@property (assign,nonatomic) int solarYear;
@end


@interface LunarSolarConverter : NSObject
/**
 *农历转公历
 */
+ (Solar *)lunarToSolar:(Lunar *)lunar;

/**
 *公历转农历
 */
+ (Lunar *)solarToLunar:(Solar *)solar;

//格式化农历,传农历的年月日
+ (NSString *)formatlunarWithYear:(int)year AndMonth:(int)month AndDay:(int)day;

//格式化农历,传农历的月日
+ (NSString *)formatlunarWithMonth:(int)month AndDay:(int)day;

//星座
+ (NSString *)getXingzuo:(NSDate *)in_date;
@end

NS_ASSUME_NONNULL_END
