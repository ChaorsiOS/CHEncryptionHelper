//
//  ViewController.m
//  CHEncryptionHelperDemo
//
//  Created by wangchao on 16/7/25.
//  Copyright © 2016年 cont. All rights reserved.
//

#import "ViewController.h"
#import "CHAESEncryption.h"
#import "CHRSAEncyyption.h"
#import "GTMBase64.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *dataTextField;
@property (weak, nonatomic) IBOutlet UITextField *AESKeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *encrypTextField;
@property (weak, nonatomic) IBOutlet UITextField *encrpyAESKEYTextField;

- (IBAction)getAESKey:(id)sender;
- (IBAction)encrpyBtnClicked:(id)sender;
- (IBAction)deencrpyBtnClicked:(id)sender;

- (IBAction)resetBtnClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//获得16位的随机数作为AES加密秘钥
- (NSString *)getRandomKey {
    
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
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

- (IBAction)getAESKey:(id)sender {
    
    self.AESKeyTextField.text = [self getRandomKey];
    
}

- (IBAction)encrpyBtnClicked:(id)sender {
    
    if (!self.dataTextField.text.length || !self.AESKeyTextField.text.length) {
        NSLog(@"%s:原始数据或AES秘钥不能为空", __func__);
        return;
    }
    
    //AES加密数据
    self.encrypTextField.text = [CHAESEncryption encryptAESData:self.dataTextField.text app_key:self.AESKeyTextField.text];
    
    //RSA加密AES秘钥
    self.encrpyAESKEYTextField.text = [CHRSAEncyyption encryptString:self.AESKeyTextField.text publicKey:RSA_PUBLICKEY];
}

- (IBAction)deencrpyBtnClicked:(id)sender {
    
    //RSA解密获得AES秘钥明文
    NSString *AESKey = [CHRSAEncyyption decryptString:self.encrpyAESKEYTextField.text privateKey:RSA_PRIVATEKEY];
    NSLog(@"AES加密秘钥为:%@", AESKey);
    
    //AES解密数据
    NSData *encrpyData = [GTMBase64 decodeString:self.encrypTextField.text];
    NSLog(@"解密后的数据为:%@", [CHAESEncryption decryptAESData:encrpyData app_key:AESKey]);
}

- (IBAction)resetBtnClicked:(id)sender {
    
    self.dataTextField.text = @"";
    self.AESKeyTextField.text = @"";
    self.encrypTextField.text = @"";
    self.encrpyAESKEYTextField.text = @"";
}
@end
