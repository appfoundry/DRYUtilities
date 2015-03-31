//
// Created by Michael Seghers on 12/02/15.
//

#import <Foundation/Foundation.h>

@interface NSNull (DRYNSNullSupport)

/**
 Returns NSNull if the given value is nil. Otherwise the given value is returned.
 
 This method shortens code that needs to transform nil values into NSNull.
 */
+ (id)dryNullOrValue:(id)value;

@end