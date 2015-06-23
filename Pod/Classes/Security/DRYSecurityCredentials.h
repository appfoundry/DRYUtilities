//
//  DRYSecurityCredentials.h
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import <Foundation/Foundation.h>

/**
 Security credentials represent a username and password pair that can be saved in secure storage through the DRYSecurityStoreWrapper. Instances of this class should not be kept in memory longer then absolutly necessary!
 */
@interface DRYSecurityCredentials : NSObject

/**
 User name.
 */
@property (nonatomic, strong, readonly) NSString *userName;
/**
 Password.
 */
@property (nonatomic, strong, readonly) NSString *password;

/**
 Instantiate user credentials with the given user name and password.
 */
- (instancetype)initWithUserName:(NSString *) userName andPassword:(NSString *) password;

@end
