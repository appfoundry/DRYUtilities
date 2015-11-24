//
//  NSString+DRYUtilTest.m
//  DRYUtilities
//
//  Created by Joris Dubois on 02/07/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "NSString+DRYUtil.h"

@interface NSString_DRYUtilTest : XCTestCase

@end

@implementation NSString_DRYUtilTest

- (void)testNonBlankStringIsNotBlank {
    NSLog(@"Is not blank: %d", [@"test" dryIsNotBlank]);
    assertThatBool([@"test" dryIsNotBlank], isTrue());
}

- (void)testBlankStringIsBlank {
    assertThatBool([@"" dryIsNotBlank], isFalse());
}

- (void)testEmptyStringAsAllSpacesStringIsBlank {
    assertThatBool([@"  " dryIsNotBlank], isFalse());
}

- (void)testNilStringIsBlank {
    NSString *nilString = nil;
    assertThatBool([nilString dryIsNotBlank], isFalse());
}

- (void)testEmptyStringWithTabAndNewLineIsBlank {
    assertThatBool([@"\t\n" dryIsNotBlank], isFalse());
}

@end
