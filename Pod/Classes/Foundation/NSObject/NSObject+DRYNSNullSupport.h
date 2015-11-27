//
// Created by Michael Seghers on 12/02/15.
//

#import <Foundation/Foundation.h>

@interface NSObject (DRYNSNullSupport)

/**
Returns NO if the receiver is nil or not NSNull.
*/
@property(nonatomic, readonly) BOOL dryIsNSNull;
/**
Returns the receiver if the receiver is not NSNull. If the receiver is NSNull, nil is returned.
*/
@property(nonatomic, readonly) id dryValueOrNil;
/**
Returns the receiver if the receiver is not NSNull. If the receiver is NSNull, the default value is returned.
*/
- (id)dryValueOrDefault:(id)defaultValue;

@end