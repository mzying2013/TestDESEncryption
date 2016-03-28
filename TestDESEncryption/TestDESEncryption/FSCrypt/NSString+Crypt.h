//
//  NSString+AES.h
//  UdpEchoClient
//
//  Created by heshidai on 14/12/4.
//
//

#import <Foundation/Foundation.h>
#import "NSData+Crypt.h"

@interface NSString(Crypt)
/**
 *  对当前字符串进行 aes 的kAesType128类型加密
 *
 *  @param key 加密 key
 *  @param iv  加密因子,不可为 nil
 *
 *  @return 加密后的字符串
 */
- (NSString *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  对当前字符串进行 aes 的kAesType128类型解密
 *
 *  @param key 解密 key
 *  @param iv  解密因子,不可为 nil
 *
 *  @return 解密后的字符串
 */
- (NSString *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  对当前字符串进行 aes 的加密
 *
 *  @param key  加密 key
 *  @param iv   加密因子,不可为 nil
 *  @param type 加密强度,
 *
 *  @return 加密后的字符串
 */
- (NSString *)AESEncryptWithKey:(NSString *)key iv:(NSString*)iv aesType:(AesType)type ;
/**
 *  对当前字符串进行 aes 的解密
 *
 *  @param key  解密 key
 *  @param iv   解密因子,不可为 nil
 *  @param type 解密强度,
 *
 *  @return 解密后的字符串
 */
- (NSString *)AESDecryptWithKey:(NSString *)key iv:(NSString*)iv aesType:(AesType)type ;

/**
 *  对当前字符串进行 des 的加密
 *
 *  @param key 加密 key
 *  @param iv  加密因子,可以为 nil
 *
 *  @return 加密后的字符串
 */
- (NSString *)DESEncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  对当前字符串进行 des 的解密
 *
 *  @param key 解密 key
 *  @param iv  解密因子,可以为 nil
 *
 *  @return 解密后的字符串
 */
- (NSString *)DESDecryptWithKey:(NSString *)key iv:(NSString *)iv;

/**
 *  MD5签名
 *
 *  @return 签名后的内容
 */
- (NSString *) md5;


@end

