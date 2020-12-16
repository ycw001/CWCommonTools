//
//  CWCommonTools+Date.m
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#import "CWCommonTools+Date.h"
#import "CalenderConverter.h"

@implementation ChineseLunarCalendar : NSObject
@end

@implementation CWCommonTools (Date)

///获取指定时间的时间戳
//Get the timestamp of the specified time
- (NSString *)getTimestampWitCWate:(NSDate *)date {
    return [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
}

///通过时间戳获取时间
///Get the Date by timestamp
- (NSDate *)getDateWithTimestamp:(NSString *)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    return date;
}

/**
 通过时间戳获取时间字符串
 Getting time through a timestamp
 
 @param timestamp 时间戳
 @param quickFormatType 快速格式化时间 Fast formatting time type
 you define foramatter
 @return 格式化过的时间
 */
- (NSString *)getTimeWithTimestamp:(NSString *)timestamp withQuickFormatType:(CWQuickFormatType)quickFormatType {
    NSDateFormatter *temp_formatter;
    switch (quickFormatType) {
        case kCWQuickFormateTypeYMD:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"yyyy-MM-dd"];
        }
            break;
        case kCWQuickFormateTypeMD:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"MM-dd"];
        }
            break;
        case kCWQuickFormateTypeYMDTime:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        }
            break;
        case kCWQuickFormateTypeTime:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"HH:mm:ss"];
        }
            break;
        case kCWQuickFormateTypeMDTime:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"MM-dd HH:mm"];
        }
            break;
        case kCWQuickFormateTypeYMDTimeZone:{
            temp_formatter = [[NSDateFormatter alloc] init];
            [temp_formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
            break;
    }
    
    NSDate* date = [self getDateWithTimestamp:timestamp];
    NSString* dateString = [temp_formatter stringFromDate:date];
    return dateString;
}

/**
 通过时间戳获取时间字符串
 Getting time through a timestamp
 
 @param timestamp 时间戳
 @param formatter 自己定义foramatter  you define foramatter
 @return 格式化过的时间
 */
- (NSString *)getTimeWithTimestamp:(NSString *)timestamp withCustomFormatter:(NSDateFormatter *)formatter {
    NSDate* date = [self getDateWithTimestamp:timestamp];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 比较两个日期的先后顺序
 Compare the order of the two dates
 
 @param firstDay 第一个日期
 @param secondDay 第二个日期
 @return 第一个日期和第二个日期比较的结果 the comparison between the first date and the second date
 NSOrderedAscending:第一个日期更早 The first date is earlier
 NSOrderedSame:两个日期一样 Two dates are the same
 NSOrderedDescending:第一个日期更晚 The first date is later
 */
- (NSComparisonResult)compareFirstDay:(NSDate *)firstDay withSecondDay:(NSDate *)secondDay withIgnoreTime:(BOOL)ignoreTime {
    if (![firstDay isKindOfClass:[NSDate class]]) {
        NSAssert(NO, @"firstDay类型错误! firstDay error in type!");
        return NSOrderedSame;
    }
    if (![secondDay isKindOfClass:[NSDate class]]) {
        NSAssert(NO, @"secondDay类型错误! secondDay error in type!");
        return NSOrderedSame;
    }
    if (!ignoreTime) {
        NSComparisonResult result = [firstDay compare:secondDay];
        return result;
    } else {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        if ([calendar compareDate:firstDay toDate:secondDay toUnitGranularity:NSCalendarUnitYear] != NSOrderedSame) {
            return [calendar compareDate:firstDay toDate:secondDay toUnitGranularity:NSCalendarUnitYear];
        }
        if ([calendar compareDate:firstDay toDate:secondDay toUnitGranularity:NSCalendarUnitMonth] != NSOrderedSame) {
            return [calendar compareDate:firstDay toDate:secondDay toUnitGranularity:NSCalendarUnitMonth];
        }
        return [calendar compareDate:firstDay toDate:secondDay toUnitGranularity:NSCalendarUnitDay];;
    }
}

#pragma mark -
#pragma mark - 中国农历和公历转换、星座生肖

///通过时间获取中国农历的对象
- (ChineseLunarCalendar *)getChineseLunarCalendarWitCWate:(NSDate *)date {
    NSDateFormatter *temp_formatter = [[NSDateFormatter alloc] init];
    [temp_formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [temp_formatter stringFromDate:date];
    NSArray *timeArray = [dateString componentsSeparatedByString:@"-"];
    return [self getChineseLunarCalendarWithYear:[[timeArray objectAtIndex:0] intValue] andMonth:[[timeArray objectAtIndex:1] intValue] andDay:[[timeArray objectAtIndex:2] intValue]];
}

///通过公历时间去创建中国农历的对象
- (ChineseLunarCalendar *)getChineseLunarCalendarWithYear:(int)year andMonth:(int)month andDay:(int)day {
    Solar *aSolar = [[Solar alloc] init];
    aSolar.solarYear = year;
    aSolar.solarMonth = month;
    aSolar.solarDay = day;
    Lunar *aLunar = [LunarSolarConverter solarToLunar:aSolar];
    
    ChineseLunarCalendar *chineseLunarCalendar = [[ChineseLunarCalendar alloc] init];
    chineseLunarCalendar.lunarYear = aLunar.lunarYear;
    chineseLunarCalendar.lunarMonth = aLunar.lunarMonth;
    chineseLunarCalendar.lunarDay = aLunar.lunarDay;
    chineseLunarCalendar.isleap = aLunar.isleap;
    return chineseLunarCalendar;
}

///通过农历的年月日获取中国农历对象
- (ChineseLunarCalendar *)getChineseLunarCalendarWithChineseLunarYear:(int)chineseLunaryear andChineseLunarMonth:(int)chineseLunarmonth andChineseLunarDay:(int)chineseLunarday andLeap:(BOOL)isleap {
    ChineseLunarCalendar *chineseLunarCalendar = [[ChineseLunarCalendar alloc] init];
    chineseLunarCalendar.lunarYear = chineseLunaryear;
    chineseLunarCalendar.lunarMonth = chineseLunarmonth;
    chineseLunarCalendar.lunarDay = chineseLunarday;
    chineseLunarCalendar.isleap = isleap;
    return chineseLunarCalendar;
}

///格式化农历的字符串
- (NSString *)getChineseLunarCalendarStrWithChineseLunarCalendar:(ChineseLunarCalendar *)chineseLunarCalendar withFormatType:(CWChineseLunarCalendarFormatType)chineseLunarCalendarFormatType {
    switch (chineseLunarCalendarFormatType) {
        case kCWChineseLunarCalendarFormatTypeYMD:{
            return [LunarSolarConverter formatlunarWithYear:chineseLunarCalendar.lunarYear AndMonth:chineseLunarCalendar.lunarMonth AndDay:chineseLunarCalendar.lunarDay];
        }
            break;
        case kCWChineseLunarCalendarFormatTypeMD:{
            return [LunarSolarConverter formatlunarWithMonth:chineseLunarCalendar.lunarMonth AndDay:chineseLunarCalendar.lunarDay];
        }
            break;
    }
}

///通过农历获取公历日期
- (NSDate *)getDateWithChineseLunarCalendar:(ChineseLunarCalendar *)chineseLunarCalendar {
    Lunar *lunar = [[Lunar alloc] init];
    lunar.lunarYear = chineseLunarCalendar.lunarYear;
    lunar.lunarMonth = chineseLunarCalendar.lunarMonth;
    lunar.lunarDay = chineseLunarCalendar.lunarDay;
    Solar *solar = [LunarSolarConverter lunarToSolar:lunar];
    NSString *dataStr = [NSString stringWithFormat:@"%d-%d-%d",solar.solarYear,solar.solarMonth,solar.solarDay];
    NSDateFormatter *temp_formatter = [[NSDateFormatter alloc] init];
    [temp_formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [temp_formatter dateFromString:dataStr];
    return date;
}

///通过农历获取生肖
- (CWChineseZodiac)getChineseZodiacWithYear:(int)year {
    int left = year%12 - 3;
    if (left < 0) {
        left = left + 12;
    }
    return left;
}

///通过日期获得星座
- (CWConstellation)getConstellationWitCWate:(NSDate *)date {
    NSString *ConstellationName = [LunarSolarConverter getXingzuo:date];
    if ([ConstellationName isEqualToString:@"摩羯座"]) {
        return kCWConstellationCapricorn;
    } else if ([ConstellationName isEqualToString:@"水瓶座"]) {
        return kCWConstellationAquarius;
    } else if ([ConstellationName isEqualToString:@"双鱼座"]) {
        return kCWConstellationPisces;
    } else if ([ConstellationName isEqualToString:@"白羊座"]) {
        return kCWConstellationAries;
    } else if ([ConstellationName isEqualToString:@"金牛座"]) {
        return kCWConstellationTaurus;
    } else if ([ConstellationName isEqualToString:@"双子座"]) {
        return kCWConstellationGemini;
    } else if ([ConstellationName isEqualToString:@"巨蟹座"]) {
        return kCWConstellationCancer;
    } else if ([ConstellationName isEqualToString:@"狮子座"]) {
        return kCWConstellationLeo;
    } else if ([ConstellationName isEqualToString:@"处女座"]) {
        return kCWConstellationVirgo;
    } else if ([ConstellationName isEqualToString:@"天秤座"]) {
        return kCWConstellationLibra;
    } else if ([ConstellationName isEqualToString:@"天蝎座"]) {
        return kCWConstellationScorpio;
    } else if ([ConstellationName isEqualToString:@"射手座"]) {
        return kCWConstellationSagittarius;
    }
    return kCWConstellationCapricorn;
}

@end
