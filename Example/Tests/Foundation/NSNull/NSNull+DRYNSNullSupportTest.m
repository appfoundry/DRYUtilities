//
//  NSNull+DRYNSNullSupport.m
//  DRYUtilities
//
//  Created by Michael Seghers on 31/03/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "NSNull+DRYNSNullSupport.h"

@interface NSNull_DRYNSNullSupportTest : XCTestCase

@end

@implementation NSNull_DRYNSNullSupportTest

- (void)testValueOrNullYieldsNSNullForNil {
    assertThat([NSNull dryNullOrValue:nil], is(equalTo([NSNull null])));
}

- (void)testValueOrNullYieldsValueForNonNill {
    NSObject *object = [[NSObject alloc] init];
    assertThat([NSNull dryNullOrValue:object], is(sameInstance(object)));
}

@end
