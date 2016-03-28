//
//
//  Created by MeMac.cn on 10-5-5.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData ( Base64 )

+ (NSData*)dataWithBase64EncodedString: (NSString*)string;
- (id)initWithBase64EncodedString: (NSString*)string;

- (NSString*)base64Encoding;
- (NSString*)base64EncodingWithLineLength: (NSUInteger)lineLength;

@end
