//
//  DRYSecurityCredentials.m
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import "DRYSecurityCredentials.h"

@implementation DRYSecurityCredentials

- (instancetype)initWithUserName:(NSString *)userName andPassword:(NSString *)password {
    self = [super init];
    if (self) {
        _userName = userName;
        _password = password;
    }
    return self;
}

@end
