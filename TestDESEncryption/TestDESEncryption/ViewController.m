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
    
    self.originalLabel.text = originalText;
    
    
    
//    NSString * encodeStr = [FSUserDefaults userDefaultsObjectForKey:debugUserDefaultKey];
//    
//    if (encodeStr) {
//        self.encodeLabel.text = encodeStr;
//    }else{
//        encodeStr = [originalText DESEncryptWithKey:encodeKey iv:nil];
//        [FSUserDefaults userDefaultsSetObject:encodeStr key:debugUserDefaultKey];
//        self.encodeLabel.text = encodeStr;
//    }
//    
//    
//    NSString * releaseEncodeStr = [FSUserDefaults userDefaultsObjectForKey:releaseUserDefaultKey];
//    if (releaseEncodeStr) {
//        self.releaseEncodeLabel.text = releaseEncodeStr;
//    }else{
//        releaseEncodeStr = [originalText DESEncryptWithKey:encodeKey iv:nil];
//        [FSUserDefaults userDefaultsSetObject:releaseEncodeStr key:releaseUserDefaultKey];
//        self.releaseEncodeLabel.text = releaseEncodeStr;
//    }
    
    
    for (NSInteger index = 0; index < 5; index ++) {
        NSString * encodes = [originalText DESEncryptWithKey:encodeKey iv:nil];
        NSString * decodes = [encodes DESDecryptWithKey:encodeKey iv:nil];
        NSLog(@"%@ -> %@  -> %@",originalText,encodes,decodes);
    }
    
    
    
    
    if (self.encodeLabel.text && self.releaseEncodeLabel.text) {
        if ([self.encodeLabel.text isEqualToString:self.releaseEncodeLabel.text]) {
            self.view.backgroundColor = [UIColor greenColor];
            return;
        }
    }
    
    self.view.backgroundColor = [UIColor orangeColor];
    
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
