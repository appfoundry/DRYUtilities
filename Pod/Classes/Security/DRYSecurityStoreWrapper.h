//
//  DRYSecurityStoreWrapper.h
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import <Foundation/Foundation.h>

@class DRYSecurityCredentials;

/**
 An objective-c wrapper around the security framework, providing access to a keychain "user name and password" aka credentials pair via a configured identifier.
 */
@interface DRYSecurityStoreWrapper : NSObject

/**
 Initializes a wrapper for the given identifier. The identifier identifies the credentials in the keychain.
 */
- (instancetype)initWithIdentifier:(NSString *) identifier;

/**
 Insert or update the given credentials.
 */
- (BOOL) persistWithCredentials:(DRYSecurityCredentials *) credentials;

/**
 Remove existing credentials if any.
 */
- (BOOL) remove;

/**
 Load the credentials.
 */
- (DRYSecurityCredentials *) load;

@end
