//
//  CWBaseCommonTools.h
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#import <Foundation/Foundation.h>
#import "CWCommonToolsConfig.h"
#import "SimpleDef.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWCommonTools : NSObject

///工具的单例 singleton
+ (CWCommonTools *)sharedCWCommonTools;

#pragma mark -
#pragma mark - 数据处理类
/**
 将log打印信息输出到文件中，调用此函数后控制台将不再显示log的打印信息
 @return 返回打印信息所在的文件路径
 The log print information is exported to the file, and the console will no longer display the print information of the log after calling this function
 Returns the path of the file where the print information is located
 */
- (NSString *)setCWDebugLogToFile;

/// 将字典或者数组转化为Data数据
//Translate dictionaries or arrays into Data
- (NSData *)JSONDataCreatedByArrayOrDictionary:(id)arrayOrDictionary;

/// 将字典或者数组转化为json字符串数据
//Translate dictionaries or arrays into JSON string data
- (NSString *)JSONStrCreatedByArrayOrDictionary:(id)arrayOrDictionary;

/// 将JSON Data串转化为字典或者数组
//Converting the JSON string Data into a dictionary or array
- (id)arrayOrNSDictionaryCreatedByJSONData:(NSData *)jsonData;

/// 将JSON串转化为字典或者数组
//Converting the JSON string into a dictionary or array
- (id)arrayOrNSDictionaryCreatedByJSONStr:(NSString *)jsonStr;

///NSArray转为NSString
//Converting NSArray into NSString
- (NSString *)stringCreatedByArray:(NSArray *)array;

///NSString通过指定的分割符转为NSArray，如果symbol为空，则默认为","
//NSString turns to NSArray by the specified division, and if symbol is empty, the default is ","
- (NSArray *)arrayCreatedByString:(NSString *)string withSymbol:(NSString *)symbol;

///unicode转换为中文
//Unicode conversion to Chinese
- (NSString *)stringConvertWithUnicodeString:(NSString *)unicodeStr;

///从指定文件名文件获取json内容
//Getting the JSON content from the specified file name file
- (id)getObjectWithJSONFileName:(NSString *)jsonFileName;

///是否是本地URL链接
///is it a local URL link
- (BOOL)isLocalURLLink:(NSString *)urlStr;

///URL字符串转为URL
///URL string to URL
- (NSURL *)urlCreatedByString:(NSString *)urlStr;

///URL转为字符串
///URL into a string
- (NSString *)urlStrCreateByURL:(NSURL *)url;

///UIApplication openURL无参数方式
///UIApplication openURL parameterless method
- (void)applicationOpenURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
