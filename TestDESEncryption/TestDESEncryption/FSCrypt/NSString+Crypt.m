//
//  NSString+AES.m
//  UdpEchoClient
//
//  Created by heshidai on 14/12/4.
//
//

#import "NSString+Crypt.h"
#import "NSData+Base64.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(AES)

- (NSString *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *enData = [data AES128EncryptWithKey:key iv:iv];
    NSString *str = [enData base64Encoding];
    return str;
}
- (NSString *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv{
    NSData *data = [NSData dataWithBase64EncodedString:self];
    NSData *deData = [data AES128DecryptWithKey:key iv:iv];
    NSString *str = [[NSString alloc] initWithData:deData encoding:NSUTF8StringEncoding];
    return str;
}

- (NSString *)AESEncryptWithKey:(NSString *)key iv:(NSString*)iv aesType:(AesType)type {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *enData = [data AESOperation:kCCEncrypt key:key iv:iv aesType:type];
    NSString *str = [enData base64Encoding];
    return str;
}
- (NSString *)AESDecryptWithKey:(NSString *)key iv:(NSString*)iv aesType:(AesType)type {
    NSData *data = [NSData dataWithBase64EncodedString:self];
    NSData *deData = [data AESOperation:kCCDecrypt key:key iv:iv aesType:type];
    NSString *str = [[NSString alloc] initWithData:deData encoding:NSUTF8StringEncoding];
    return str;
    
}


- (NSString *)DESEncryptWithKey:(NSString *)key iv:(NSString *)iv{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *enData = [data DESEncryptWithKey:key iv:iv];
    
    NSString *str = [enData base64Encoding];
    return str;
    
}
- (NSString *)DESDecryptWithKey:(NSString *)key iv:(NSString *)iv{
    NSData *data = [NSData dataWithBase64EncodedString:self];
    NSData *deData = [data DESDecryptWithKey:key iv:iv];
    NSString *str = [[NSString alloc] initWithData:deData encoding:NSUTF8StringEncoding];
    return str;
}


- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];      
}



@end

