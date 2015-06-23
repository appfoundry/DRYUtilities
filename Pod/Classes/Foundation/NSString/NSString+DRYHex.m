//
//  NSString+DRYHex.m
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import "NSString+DRYHex.h"

@implementation NSString (DRYHex)

+ (NSString *)dryStringWithHexFromData:(NSData *)data {
    const unsigned char *dataBuffer = (const unsigned char *)[data bytes];
    NSString *result;
    
    if (!dataBuffer) {
        result = nil;
    } else {
        NSUInteger dataLength  = data.length;
        NSMutableString *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
        
        for (int i = 0; i < dataLength; ++i) {
            [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
        }
        result = [hexString copy];
    }
    return result;
}

@end
