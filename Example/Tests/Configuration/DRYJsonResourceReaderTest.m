//
//  DRYJsonResourceReaderTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 03/12/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "DRYJsonResourceReader.h"

@interface DRYJsonResourceReaderTest : XCTestCase {
    DRYJsonResourceReader *_reader;
}

@end

@implementation DRYJsonResourceReaderTest

#pragma mark - Read property from plist without fallback resource
- (void)testReadProperty_shouldReturnPropertyFromPlist {
    _reader = [[DRYJsonResourceReader alloc] initWithJsonNamed:@"TestResource"];
    assertThat([_reader readPropertyWithKey:@"testKey"], is(equalTo(@"testValue")));
}

- (void)testReadProperty_shouldReturnNilWhenKeyNotFoundAndNoFallbackAvailable {
    _reader = [[DRYJsonResourceReader alloc] initWithJsonNamed:@"TestResource"];
    assertThat([_reader readPropertyWithKey:@"fallbackKey"], is(nilValue()));
}

- (void)testShouldNotInitWithNonDictionaryJson {
    _reader = [[DRYJsonResourceReader alloc] initWithJsonNamed:@"Array"];
    assertThat(_reader, is(nilValue()));
}

@end