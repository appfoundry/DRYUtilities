//
//  NSString+TemplateReplacementTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 12/02/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "NSString+DRYTemplateReplacement.h"

@interface NSString_DRYTemplateReplacementTest : XCTestCase

@end

@implementation NSString_DRYTemplateReplacementTest

- (void)testReplacementShouldBeDone {
    NSString *string = @"{key1}sometext{key2}";
    NSDictionary *replacementDictionary = @{@"key1" : @1, @"key2" : @"value2"};
    assertThat([string dryStringByReplacingTemplatesWithValuesFromDictionary:replacementDictionary], is(equalTo(@"1sometextvalue2")));
}

@end
