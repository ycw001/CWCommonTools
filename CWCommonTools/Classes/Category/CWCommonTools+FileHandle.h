//
//  CWCommonTools+FileHandle.h
//  CWCommonTools
//
//  Created by CW on 2020/12/16.
//

#import "CWBaseCommonTools.h"

typedef NS_ENUM(NSUInteger, CWFileDirectoryType) {
    kCWFileDirectoryTypeHome,       //程序主目录
    kCWFileDirectoryTypeDocuments,  //应用中用户数据可以放在这里，iTunes备份和恢复的时候会包括此目录
    kCWFileDirectoryTypeTmp,        //存放临时文件，iTunes不会备份和恢复此目录，此目录下文件可能会在应用退出后删除
    kCWFileDirectoryTypeCaches,     //存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
};

NS_ASSUME_NONNULL_BEGIN

@interface CWCommonTools (FileHandle)

#pragma mark -
#pragma mark - 文件处理管理类
///获取文件夹路径
- (NSURL *)getFileDirectoryWithType:(CWFileDirectoryType)directoryType;

///在指定文件夹中创建文件夹
- (NSURL *)createFileDirectoryWithType:(CWFileDirectoryType)directoryType andDirectoryName:(NSString *)directoryName;

///指定路径的文件大小，单位b
///get the file size at path,the Unit is b
- (long long)fileSizeAtPath:(NSString *)filePath;

///指定路径的文件夹总大小，单位b
///get the folder size at path,the Unit is b
- (float)folderSizeAtPath:(NSString *)folderPath;




#pragma mark - 以下即将废弃的接口

///将Data内容写入本地保存，重新命名，返回保存过的路径
// Write the Data content to local save, rename, and return the saved path
- (NSString *)saveData:(NSData *)data withFileName:(NSString *)fileName DEPRECATED_MSG_ATTRIBUTE("该接口即将被废弃，使用[data writeToFile:filePath atomically:YES];代替");

///在Document创建子文件夹并返回创建后的路径
//Create a subfolder in Document And return to the created path
- (NSString *)createDocumentSubFolderWithName:(NSString *)folderName DEPRECATED_MSG_ATTRIBUTE("使用createFileDirectoryWithType:andDirectoryName");

///检查文件夹下是否有指定文件名文件
//Check if there is a specified file name file under the folder
- (BOOL)isExistFileWithfileName:(NSString *)fileName andSubfolderName:(NSString *)folderName DEPRECATED_MSG_ATTRIBUTE("冗余函数，即将废除");

///获取在Document文件夹里的或者子文件夹里面对应文件名的路径
//Get the path to the file name in the Document folder or in the subfolder
- (NSString *)getFilePathByfileName:(NSString *)fileName andSubfolderName:(NSString *)folderName DEPRECATED_MSG_ATTRIBUTE("冗余函数，即将废除");

@end

NS_ASSUME_NONNULL_END
