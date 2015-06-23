//
//  NSString+DRYHexTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 23/06/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "NSString+DRYHex.h"

@interface NSString_DRYHexTest : XCTestCase

@end

@implementation NSString_DRYHexTest

- (void)testDataToHex {
    char bytes[17] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    NSData *data = [NSData dataWithBytes:bytes length:17];
    assertThat([NSString dryStringWithHexFromData:data], is(equalTo(@"000102030405060708090a0b0c0d0e0f10")));
}

@end
