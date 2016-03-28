//
//  NSData+AES.h
//  UdpEchoClient
//
//  Created by heshidai on 14/12/4.
//
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
/**
 支持的加密强度aes类型
 */
enum {
    kAesType128 = 128,
    kAesType192 = 192,
    kAesType256 = 256,
};
typedef NSUInteger AesType;

@interface NSData (Crypt)
/**
 *  对当前数据对象加密
 *
 *  @param operation 加密/解密 类型
 *  @param key       加密/解密 key
 *  @param iv        加密/解密 因子
 *  @param aesType    AES加密/解密的强度类型
 *
 *  @return 加密/解密后的数据对象,失败时返回 nil
 */
- (NSData *)AESOperation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv aesType:(AesType)aesType ;
/**
 *  默认以 kAesType128 方式加密/解密
 *
 *  @param operation 加密/解密 类型
 *  @param key       加密/解密 key
 *  @param iv        加密/解密 因子
 *
 *  @return 加密/解密后的数据对象,失败时返回 nil
 */
- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv;
/**
 *  默认以 kAesType128 方式加密
 *
 *  @param key 加密 key
 *  @param iv  加密 因子
 *
 *  @return 加密后的数据对象,失败时返回 nil
 */
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *  默认以 kAesType128 方式解密
 *
 *  @param key 解密 key
 *  @param iv  解密 因子
 *
 *  @return 解密后的数据对象,失败时返回 nil
 */
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *   DES 的加密
 *
 *  @param key 加密 key
 *  @param iv  加密 因子,如果没有,则默认为{1,2,3,4,5,6,7,8}的地址引用
 *
 *  @return 加密后的数据对象,失败时返回 nil
 */
-(NSData *)DESEncryptWithKey:(NSString *)key iv:(NSString *)iv;
/**
 *   DES 的解密
 *
 *  @param key 解密 key
 *  @param iv  解密 因子,如果没有,则默认为{1,2,3,4,5,6,7,8}的地址引用
 *
 *  @return 解密后的数据对象,失败时返回 nil
 */
-(NSData *)DESDecryptWithKey:(NSString *)key iv:(NSString *)iv;
@end
