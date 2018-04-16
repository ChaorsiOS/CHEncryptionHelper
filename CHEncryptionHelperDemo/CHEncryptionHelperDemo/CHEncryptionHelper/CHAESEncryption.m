//
//  CHAESEncryption.m
//  CHEncryptionHelperDemo
//
//  Created by wangchao on 16/7/25.
//  Copyright © 2016年 cont. All rights reserved.
//

#import "CHAESEncryption.h"
#import "GTMBase64.h"
#import "NSData+AES.h"
#import "NSData+AES256.h"

#include "iconv.h"


@implementation CHAESEncryption

#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString * )input {
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
}

+ (NSString*)decodeBase64String:(NSString * )input {
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
}

+ (NSString*)encodeBase64Data:(NSData *)data {
    
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
}

+ (NSString*)decodeBase64Data:(NSData *)data {
    
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
}

#pragma mark - AES加密
//将string转成带密码的data
+(NSString*)encryptAESData:(NSString*)string app_key:(NSString*)key
{
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    NSData *encryptedData = [data AES256EncryptWithKey:key];
    //    NSLog(@"加密后的字符串 :%@",[encryptedData base64Encoding]);
    
    return [encryptedData base64Encoding];
}

#pragma mark - AES解密
//将带密码的data转成string
+(NSString*)decryptAESData:(NSData*)data  app_key:(NSString*)key
{
    //使用密码对data进行解密
    NSData *decryData = [data AES256DecryptWithKey:key];
    //将解了密码的nsdata转化为nsstring
    
    NSString *str = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    
    return str;
}

//获取随机生成的16位AES加密秘钥
+ (NSString *)getRandomAESKey {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform((float)numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:16];
    free(characters);
    
    return result;
}


@end

