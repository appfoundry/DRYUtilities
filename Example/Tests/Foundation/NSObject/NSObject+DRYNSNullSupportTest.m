//
//  NSObject+NSNullSupportTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 12/02/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "NSObject+DRYNSNullSupport.h"

@interface NSObject_DRYNSNullSupportTest : XCTestCase

@end

@implementation NSObject_DRYNSNullSupportTest

- (void)testNSObjectsDefaultToNOForisNSNull {
    assertThatBool([@"" dryIsNSNull], isFalse());
}

- (void)testNSNullIsYesForIsNull {
    assertThatBool([[NSNull null] dryIsNSNull], isTrue());
}

- (void)testValueOrNullReturnsObjectForObjects {
    assertThat([@"" dryValueOrNil], is(equalTo(@"")));
}

- (void)testValueOrNullReturnsNilForNSNull {
    assertThat([[NSNull null] dryValueOrNil], is(nilValue()));
}

- (void)testValueOrDefaultReturnsObjectForObjects {
	NSString *originalValue = @"originalValue";
	assertThat([originalValue dryValueOrDefault:@"defaultValue"], is(sameInstance(originalValue)));
}

- (void)testValueOrDefaultReturnsDefaultNSNull {
	NSString *defaultValue = @"defaultValue";
	assertThat([[NSNull null] dryValueOrDefault:defaultValue], is(sameInstance(defaultValue)));
}

@end
