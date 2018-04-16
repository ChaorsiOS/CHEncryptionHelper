//
//  CHRSAEncyyption.h
//  CHEncryptionHelperDemo
//
//  Created by wangchao on 16/7/25
//  Copyright © 2016年 cont. All rights reserved.
//

#import <Foundation/Foundation.h>

//RSA公钥
#define RSA_PUBLICKEY [NSString stringWithFormat:@"%@\r%@\r%@\r%@\r%@\r", @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDMAwhiHHMzX68dZypi2ogtInP", @"FVmrzBuLPM4gugKrufRaStBDoq3Af7rElcrbVQnoUIGW7tTwBgG79Ys3IjRD4QQo", @"g3mWnNwVPAsqlCaAfgiFR5eHqo3cOprAic49z", @"/Pm30Qu8D9YL1iBuiZeiHQshd28", @"8N0MQVk/uKhrhAvCeQIDAQAB"]

//RSA私钥
#define RSA_PRIVATEKEY [NSString stringWithFormat:@"%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r%@\r", @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMMwDCGIcczNfrx1", @"nKmLaiC0ic8VWavMG4s8ziC6Aqu59FpK0EOircB", @"/usSVyttVCehQgZbu1PAGAbv1", @"izciNEPhBCiDeZac3BU8CyqUJoB", @"+CIVHl4eqjdw6msCJzj3P8+bfRC7wP1gvWIG6", @"Jl6IdCyF3bzw3QxBWT+4qGuEC8J5AgMBAAECgYBmj2SQaiWBu6iQVixPWhYVwUd4", @"LHvFraX7b6PPxm2I1ljy6MSuBVjPAU6d5SeGQBTIoSS2rh/tTvqyTL8t5ScYaL+A", @"p/LDSHWIna3GDHar5pd4v1BduB9YYnqxt03QDL107PwRdc/iqlrnES3yf3ZthBaV", @"3yUWnvMJGKCVI0WYkQJBAOLLNXHJmcaanAi9nNSgWsM7TQtHs9D+RX/rjVjvlodY", @"Fe1A7FmlcRZkz7Hs3/g3bjLvSqfsJ/1MccSHE2tRGTMCQQDcUt5+4jAyhYCNFsBu", @"k45F8Ut0TAsYp0js6naHYE8B2tCo2p9DLkiOdU406SY00ilETOd2gTf5KWF6YJSF", @"mm2jAkEAkENjA7aRstu2VXkHwdke4wFdyMcbgt27p9tWVjRRNFa72+docL3kabJG", @"y486CNJ5rry4aIi4B1ARLkod+C3mMQJAMoBUO6VBAvOS6cQjS7VK0UFj2D5t9LKz", @"hoqfrJwov/YWCf5CrzV2sCC3Um12snjRuLQgAgvQdq5Dh7eHk7A4HQJAA7YcIH5l", @"k+PocyaIQDnErQgkmdb5Pb9SFp4HUfHD+m7J7FnN+tmtjAp09ao4W72NxmlmYaJE", @"2cdtvyo70bxE3Q=="]

@interface CHRSAEncyyption : NSObject

/**
 *  RSA加密
 *
 *  @param str    要加密的数据
 *  @param pubKey 加密公钥
 *
 *  @return 加密后的密文数据
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 *  RSA加密
 *
 *  @param str     要解密的数据
 *  @param privKey 解密私钥
 *
 *  @return 解密后的明文数据
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;


@end
