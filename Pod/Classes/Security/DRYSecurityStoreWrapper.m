//
//  DRYSecurityStoreWrapper.m
//  Pods
//
//  Created by Michael Seghers on 23/06/15.
//
//

#import "DRYSecurityStoreWrapper.h"
#import "DRYSecurityCredentials.h"

@interface DRYSecurityStoreWrapper () {
    NSString *_identifier;
    NSDictionary *_genericPasswordQuery;
}

@end

@implementation DRYSecurityStoreWrapper

- (id)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    if (self) {
        _identifier = identifier;
        _genericPasswordQuery = @{
                                  (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
                                  (__bridge id)kSecAttrGeneric: _identifier,
                                  (__bridge id)kSecMatchLimit: (__bridge id)kSecMatchLimitOne,
                                  (__bridge id)kSecReturnAttributes: (__bridge id)kCFBooleanTrue
                                  };
        
    }
    return self;
}

- (DRYSecurityCredentials *)load {
    DRYSecurityCredentials *result = nil;
    NSDictionary *credentialAttributes = [self _loadAttributesWithQuery:_genericPasswordQuery];
    if (credentialAttributes) {
        result = [self _getCredentialsFromAttributes:credentialAttributes];
    }
    return result;
}

- (NSDictionary *) _loadAttributesWithQuery:(NSDictionary *) query {
    CFDictionaryRef attributes = NULL;
    NSMutableDictionary *dataLoadingQuery = [NSMutableDictionary dictionaryWithDictionary:query];
    [dataLoadingQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    OSStatus err = SecItemCopyMatching((__bridge CFDictionaryRef)dataLoadingQuery, (CFTypeRef *)&attributes);
    NSDictionary *result = nil;
    if (err == noErr) {
        result = (__bridge NSDictionary *)attributes;
    }
    if (attributes) {
        CFRelease(attributes);
    }
    return result;
}

- (DRYSecurityCredentials *) _getCredentialsFromAttributes:(NSDictionary *) attributes {
    NSString *userName = attributes[(__bridge id) kSecAttrAccount];
    NSString *password = [[NSString alloc] initWithData:attributes[(__bridge id) kSecValueData] encoding:NSUTF8StringEncoding];
    return [[DRYSecurityCredentials alloc] initWithUserName:userName andPassword:password];
}

- (BOOL)persistWithCredentials:(DRYSecurityCredentials *)credentials {
    NSDictionary *userInfoData = [self _dataTemplateForGenericPasswordForAccount:credentials.userName andValue:credentials.password];
    return [self _persistWithAttributeData:userInfoData query:_genericPasswordQuery];
}

- (BOOL) _persistWithAttributeData:(NSDictionary *) data query:(NSDictionary *) query {
    CFDictionaryRef attributes = NULL;
    BOOL result;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&attributes) == noErr) {
        result = [self _updateWithAttributeData:data attributes:attributes];
    } else {
        result = [self _insertAttributeData:data];
    }
    if(attributes) {
        CFRelease(attributes);
    }
    return result;
}

- (BOOL) _updateWithAttributeData:(NSDictionary *)data attributes:(CFDictionaryRef)attributes {
    BOOL result;
    NSMutableDictionary *tempCheck = [NSMutableDictionary dictionaryWithDictionary:data];
    [tempCheck removeObjectForKey:(__bridge id)kSecClass];
    
    NSMutableDictionary *updateItem = [NSMutableDictionary dictionaryWithDictionary:(__bridge NSDictionary *)attributes];
    [updateItem setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    OSStatus error = SecItemUpdate((__bridge CFDictionaryRef)updateItem, (__bridge CFDictionaryRef)tempCheck);
    result = error == noErr;
    return result;
}

- (BOOL) _insertAttributeData:(NSDictionary *) data {
    OSStatus error = SecItemAdd((__bridge CFDictionaryRef)data, NULL);
    return error == noErr;
}

- (BOOL)remove {
    BOOL result = NO;
    NSDictionary *userInfoAttrs = [self _loadAttributesWithQuery:_genericPasswordQuery];
    if (userInfoAttrs) {
        NSMutableDictionary *adapted = [NSMutableDictionary dictionaryWithDictionary:userInfoAttrs];
        [adapted setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
        OSStatus err = SecItemDelete((__bridge CFDictionaryRef)adapted);
        result = err == noErr;
    }
    
    return result;
}

- (NSDictionary *) _dataTemplateForGenericPasswordForAccount:(NSString *) account andValue:(NSString *) value {
    return @{
             (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
             (__bridge id)kSecAttrGeneric: _identifier,
             (__bridge id)kSecAttrAccount: account,
             (__bridge id)kSecAttrLabel: @"",
             (__bridge id)kSecAttrDescription: @"",
             (__bridge id)kSecValueData:  [value dataUsingEncoding:NSUTF8StringEncoding],
             (__bridge id)kSecAttrAccessible: (__bridge id)kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
             
             };
}

@end
