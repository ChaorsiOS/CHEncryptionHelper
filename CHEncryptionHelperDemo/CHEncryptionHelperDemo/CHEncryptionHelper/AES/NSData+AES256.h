//
//  NSData+AES256.h
//  AirTakeoff
//
//  Created by 罗函 on 16/5/11.
//  Copyright © 2016年 LuohanCC. All rights reserved.
//
//
//NSData+AES256.h
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@class NSString;

@interface NSData (Encryption)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密
- (NSString *)newStringInBase64FromData;            //追加64编码
+ (NSString*)base64encode:(NSString*)str;           //同上64编码
@end