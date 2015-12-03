//
//  NSString+DRYHex.h
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (DRYHex)

/**
 Returns a hexadecimal representation of the bytes in the given data.
 */
+ (NSString *)dryStringWithHexFromData:(NSData *)data;

@end
