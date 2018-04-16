//
//  CHAESEncryption.h
//  CHEncryptionHelperDemo
//
//  Created by wangchao on 16/7/25.
//  Copyright © 2016年 cont. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHAESEncryption : NSObject

#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;

+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

#pragma mark - AES加密

/**
 *  AES加密
 *
 *  @param string 要加密的数据
 *  @param key    加密秘钥，一般用16位的随机数作为加密秘钥
 *
 *  @return 加密后的密文
 */
+ (NSString*)encryptAESData:(NSString*)string app_key:(NSString*)key ;

//将带密码的data转成string
+(NSString*)decryptAESData:(NSData*)data app_key:(NSString*)key ;


//获取随机生成的16位AES加密秘钥
+ (NSString *)getRandomAESKey;

@end
