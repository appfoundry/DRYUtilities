//
// Created by Michael Seghers on 12/02/15.
//

#import "NSObject+DRYNSNullSupport.h"


@implementation NSObject (DRYNSNullSupport)

- (BOOL)dryIsNSNull {
    return NO;
}

- (id)dryValueOrNil {
    return self;
}

@end