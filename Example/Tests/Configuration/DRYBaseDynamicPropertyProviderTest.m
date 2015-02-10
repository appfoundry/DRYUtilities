//
//  DRYBaseDynamicPropertyProviderTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 10/02/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "DRYBaseDynamicPropertyProvider.h"
#import "DRYResourceReader.h"

@protocol DRYConfigurationSpocForTest <NSObject>

@property (nonatomic, readonly) NSString *unfoundProperty;
@property (nonatomic, readonly) NSString *foundProperty;

@end

@interface DRYBaseDynamicPropertyProvider (Test) <DRYConfigurationSpocForTest>
@end

@implementation DRYBaseDynamicPropertyProvider (Test)

@dynamic unfoundProperty;
@dynamic foundProperty;

@end


@interface DRYBaseDynamicPropertyProviderTest : XCTestCase {
    id<DRYConfigurationSpocForTest> _provider;
    id<DRYResourceReader> _reader;
}

@end

@implementation DRYBaseDynamicPropertyProviderTest

- (void)setUp {
    [super setUp];
    _reader = mockProtocol(@protocol(DRYResourceReader));
    _provider = [[DRYBaseDynamicPropertyProvider alloc] initWithResourceReader:_reader];
}

- (void)testGetDynamicProperty {
    [given([_reader readPropertyWithKey:@"foundProperty"]) willReturn:@"result"];
    assertThat(_provider.foundProperty, is(equalTo(@"result")));
}

- (void)testGetUnfoundProperty {
    [given([_reader readPropertyWithKey:@"unfoundProperty"]) willReturn:nil];
    assertThat(_provider.unfoundProperty, is(nilValue()));
}

@end
