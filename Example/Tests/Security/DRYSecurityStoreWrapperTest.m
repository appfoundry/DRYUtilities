//
//  DRYSecurityStoreWrapperTest.m
//  DRYUtilities
//
//  Created by Michael Seghers on 23/06/15.
//  Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "DRYSecurityStoreWrapper.h"
#import "DRYSecurityCredentials.h"

#define TEST_IDENTIFIER @"be.appfoundry.dryutilities.test.Identifier"

@interface DRYSecurityStoreWrapperTest : XCTestCase {
    DRYSecurityStoreWrapper *_wrapper;
}

@end

@implementation DRYSecurityStoreWrapperTest

- (void)setUp {
    [super setUp];
    _wrapper = [[DRYSecurityStoreWrapper alloc] initWithIdentifier:TEST_IDENTIFIER];
}

- (void)tearDown {
    [_wrapper remove];
    [super tearDown];
}

- (void)testPersist {
    BOOL result = [_wrapper persistWithCredentials:[[DRYSecurityCredentials alloc] initWithUserName:@"test" andPassword:@"password"]];
    assertThatBool(result, isTrue());
}

- (void)testPersistAndFetch {
    [_wrapper persistWithCredentials:[[DRYSecurityCredentials alloc] initWithUserName:@"test" andPassword:@"password"]];
    DRYSecurityCredentials *result = [_wrapper load];
    
    assertThat(result, allOf(hasProperty(@"userName", @"test"), hasProperty(@"password", @"password"), nil));
}


@end
