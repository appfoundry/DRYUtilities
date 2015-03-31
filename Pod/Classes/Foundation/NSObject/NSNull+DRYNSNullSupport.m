//
// Created by Michael Seghers on 12/02/15.
//

#import "NSNull+DRYNSNullSupport.h"
#import "NSObject+DRYNSNullSupport.h"

@implementation NSNull (DRYNSNullSupport)

- (BOOL)dryIsNSNull {
    return YES;
}

- (id)dryValueOrNil {
    return nil;
}

+ (id)dryNullOrValue:(id)value {
    return value ? :[NSNull null];
}


@end