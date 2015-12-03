//
//  DRYDictionaryResourceReaderTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 03/12/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "DRYDictionaryResourceReader.h"

@interface DRYDictionaryResourceReaderTest : XCTestCase {
    DRYDictionaryResourceReader *_reader;
    DRYDictionaryResourceReader *_readerWithFallback;
    id<DRYResourceReader> _resourceReader;
}

@end

@implementation DRYDictionaryResourceReaderTest

- (void)setUp {
    [super setUp];
    _resourceReader = mockProtocol(@protocol(DRYResourceReader));
    NSDictionary *dictionary = @{@"key": @"value", @"testKey": @"testValue"};
    _reader = [[DRYDictionaryResourceReader alloc] initWithDictionary:dictionary];
    _readerWithFallback = [[DRYDictionaryResourceReader alloc] initWithDictionary:dictionary fallbackResourceReader:_resourceReader];
}

- (void)testReadProperty_shouldReturnPropertyFromDictionary {
    assertThat([_reader readPropertyWithKey:@"key"], is(equalTo(@"value")));
}

- (void)testReadProperty_shouldReturnNilWhenKeyNotFoundAndNoFallbackAvailable {
    assertThat([_reader readPropertyWithKey:@"fallbackKey"], is(nilValue()));
}

#pragma mark - Read property from plist without with fallback resource
- (void)testReadProperty_shouldReturnPropertyFromDictionary_evenIfFallbackIsAvailable {
    [given([_resourceReader readPropertyWithKey:@"testKey"]) willReturn:@"fallback"];
    assertThat([_readerWithFallback readPropertyWithKey:@"testKey"], is(equalTo(@"testValue")));
}

- (void)testReadProperty_shouldReturnFallBackValueWhenKeyNotFoundAndFallbackAvailable {
    [given([_resourceReader readPropertyWithKey:@"fallbackKey"]) willReturn:@"fallbackValue"];
    assertThat([_readerWithFallback readPropertyWithKey:@"fallbackKey"], is(equalTo(@"fallbackValue")));
}


@end
