//
//  CWCommonTools+Encrypt.h
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#import "CWBaseCommonTools.h"

NS_ASSUME_NONNULL_BEGIN

//加密类型
typedef NS_ENUM(NSUInteger, CWSHAEncryType) {
    kCWSHAEncryTypeSha1,
    kCWSHAEncryTypeSha224,
    kCWSHAEncryTypeSha256,
    kCWSHAEncryTypeSha384,
    kCWSHAEncryTypeSha512,
};

@interface CWCommonTools (Encrypt)
#pragma mark -
#pragma mark - 加密解密相关操作类

/**
 字符串MD5加密 String MD5 encryption
 @param string 要加密的字符串 String to be encrypted
 @param lowercase 是否小写 Is it a lowercase
 @return 加密过的字符串 Encrypted string
 */
- (NSString *)MD5EncryptWithString:(NSString *)string withLowercase:(BOOL)lowercase;

/**
字符串SHA加密 String SHA1 encryption
@param string 要加密的字符串 String to be encrypted
@param shaType 要加密的类型  encrypte type
@param lowercase 是否小写 Is it a lowercase
@return 加密过的字符串 Encrypted string
*/
- (NSString *)SHAEncryptWithString:(NSString *)string withType:(CWSHAEncryType)shaType withLowercase:(BOOL)lowercase;

/**
 字符串aes256加密  String aes256 encryption
 @param plain 要加密的字符串 String to be encrypted
 @param key 加密的key值 Encrypted key values
 @return 加密后的字符串 Encrypted string
 */
- (NSString *)AES256EncryptWithPlainText:(NSString *)plain andKey:(NSString *)key;


/**
 字符串aes256解密

 @param ciphertexts 要解密的字符串 String aes256 Decrypted
 @param key 加密的key值 Encrypted key values
 @return 解密后的字符串 Decrypted string
 */
- (NSString *)AES256DecryptWithCiphertext:(NSString *)ciphertexts andKey:(NSString *)key;

///字符串转unicode
- (NSString *)unicodeEncodeWithString:(NSString *)string;

///unicode转字符串
- (NSString *)unicodeDecodeWithString:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
