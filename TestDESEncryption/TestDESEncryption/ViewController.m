//
//  ViewController.m
//  TestDESEncryption
//
//  Created by Bill liu on 16/3/28.
//  Copyright © 2016年 heshidai. All rights reserved.
//

#import "ViewController.h"
#import "FSUserDefaults.h"
#import "NSString+Crypt.h"
#import "DES3Util.h"


static NSString * const originalText = @"LIUMIN555198";
static NSString * const encodeKey = @"key12345";

static NSString * const debugUserDefaultKey = @"debugUserDefaultKey";
static NSString * const releaseUserDefaultKey = @"releaseUserDefaultKey";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *originalLabel;
@property (weak, nonatomic) IBOutlet UILabel *encodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *releaseEncodeLabel;

- (IBAction)clearBtnAction:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSLog(@"FinancialService方法");
    NSInteger times = 3;
    
    for (NSInteger index = 0; index < times; index ++) {
        NSString * encodes1 = [originalText DESEncryptWithKey:encodeKey iv:nil];
        NSString * encodes2 = [encodes1 DESEncryptWithKey:encodeKey iv:nil];
        NSString * decodes1 = [encodes2 DESDecryptWithKey:encodeKey iv:nil];
        NSString * decodes2 = [decodes1 DESDecryptWithKey:encodeKey iv:nil];
        NSLog(@"%@ -> %@ -> %@  -> %@ -> %@",originalText,encodes1,encodes2,decodes1,decodes2);
    }

    
    NSLog(@"\n\n");
    NSLog(@"GitHud方法");
    for (NSInteger index = 0; index < times; index ++) {
        NSString * encodes1 = [DES3Util encryptUseDES:originalText key:encodeKey];
        NSString * encodes2 = [DES3Util encryptUseDES:encodes1 key:encodeKey];
        NSString * decodes1 = [DES3Util decryptUseDES:encodes2 key:encodeKey];
        NSString * decodes2 = [DES3Util decryptUseDES:decodes1 key:encodeKey];
        NSLog(@"%@ -> %@ -> %@ -> %@ -> %@",originalText,encodes1,encodes2,decodes1,decodes2);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)clearBtnAction:(id)sender {
    [FSUserDefaults userDefaultsRemoveObjectForKey:debugUserDefaultKey];
    [FSUserDefaults userDefaultsRemoveObjectForKey:releaseUserDefaultKey];
}
@end
