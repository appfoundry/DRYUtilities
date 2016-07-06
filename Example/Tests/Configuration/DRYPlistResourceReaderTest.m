//
//  DRYPlistResourceReaderTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 10/02/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "DRYPlistResourceReader.h"

@interface DRYPlistResourceReaderTest : XCTestCase {
    DRYPlistResourceReader *_reader;
}

@end

@implementation DRYPlistResourceReaderTest

#pragma mark - Read property from plist without fallback resource
- (void)testReadProperty_shouldReturnPropertyFromPlist {
    _reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"TestResource" inBundle:[NSBundle bundleForClass:[self class]]];
    assertThat([_reader readPropertyWithKey:@"testKey"], is(equalTo(@"testValue")));
}

- (void)testReadProperty_shouldReturnNilWhenKeyNotFoundAndNoFallbackAvailable {
    _reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"TestResource"];
    assertThat([_reader readPropertyWithKey:@"fallbackKey"], is(nilValue()));
}

#pragma mark - Read property from plist without with fallback resource
- (void)testReadProperty_shouldReturnPropertyFromPlist_evenIfFallbackIsAvailable {
    _reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"TestResource" andFallbackPlistNamed:@"FallbackTestResource" inBundle:[NSBundle bundleForClass:[self class]]];
    assertThat([_reader readPropertyWithKey:@"testKey"], is(equalTo(@"testValue")));
}

- (void)testReadProperty_shouldReturnFallBackValueWhenKeyNotFoundAndFallbackAvailable {
    _reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"TestResource" andFallbackPlistNamed:@"FallbackTestResource" inBundle:[NSBundle bundleForClass:[self class]]];
    assertThat([_reader readPropertyWithKey:@"fallbackKey"], is(equalTo(@"fallbackValue")));
}

@end
