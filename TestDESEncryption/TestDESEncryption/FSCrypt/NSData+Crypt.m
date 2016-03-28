//
//  NSData+AES.m
//  UdpEchoClient
//
//  Created by heshidai on 14/12/4.
//
//

#import "NSData+Crypt.h"


@implementation NSData (Crypt)

- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv {
    return [self AESOperation:operation key:key iv:iv aesType:kAesType128];
}
- (NSData *)AESOperation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv aesType:(AesType)aesType
{
    NSUInteger aesKeySizeType;
    NSUInteger aesBlockSizeType = kCCBlockSizeAES128;
    CCAlgorithm aesAlgorithmType = kCCAlgorithmAES128;
    switch (aesType) {
        case kAesType128:
            aesKeySizeType = kCCKeySizeAES128;
            break;
        case kAesType192:
            aesKeySizeType = kCCKeySizeAES192;
            break;
        case kAesType256:
            aesKeySizeType = kCCKeySizeAES256;
            break;
        default:
            aesKeySizeType = kCCKeySizeAES128;
            break;
    }
    
    char keyPtr[aesKeySizeType + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[aesBlockSizeType + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + aesBlockSizeType;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          aesAlgorithmType,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          aesBlockSizeType,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES128Operation:kCCEncrypt key:key iv:iv];
}

- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES128Operation:kCCDecrypt key:key iv:iv];
}


-(NSData *)DESEncryptWithKey:(NSString *)key iv:(NSString *)iv {
    
    return [self DESOperation:kCCEncrypt key:key iv:iv];
}
-(NSData *)DESDecryptWithKey:(NSString *)key iv:(NSString *)iv {
    
    return [self DESOperation:kCCDecrypt key:key iv:iv];
}
- (NSData *)DESOperation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv {
    
    const void *vplainText;
    size_t plainTextBufferSize;
    
    plainTextBufferSize = [self length];
    vplainText = [self bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec;
    if (iv) {
        vinitVec= (const void *) [iv UTF8String];
    }else{
        Byte vinitVecT[] =  {1,2,3,4,5,6,7,8};
        vinitVec = &vinitVecT;
    }
    ccStatus = CCCrypt(operation,
                       kCCAlgorithmDES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySizeDES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
//    if (ccStatus == kCCParamError) DDLogError(@"PARAM ERROR");
//    else if (ccStatus == kCCBufferTooSmall) DDLogError( @"BUFFER TOO SMALL");
//    else if (ccStatus == kCCMemoryFailure) DDLogError( @"MEMORY FAILURE");
//    else if (ccStatus == kCCAlignmentError) DDLogError( @"ALIGNMENT");
//    else if (ccStatus == kCCDecodeError) DDLogError( @"DECODE ERROR");
//    else if (ccStatus == kCCUnimplemented) DDLogError( @"UNIMPLEMENTED");
    NSData *data = nil;
    if (ccStatus==kCCSuccess) {
        data = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    }
    
    free(bufferPtr);
    return data;
}

@end
