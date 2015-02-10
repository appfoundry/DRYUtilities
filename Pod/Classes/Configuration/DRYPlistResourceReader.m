//
//  DRYPlistResourceReader.m
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import "DRYPlistResourceReader.h"

@interface DRYPlistResourceReader () {
    NSDictionary *_configContent;
    NSDictionary *_defaultContentConfig;
}

@end


@implementation DRYPlistResourceReader

- (instancetype)initWithPlistNamed:(NSString *)plistName {
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:plistName ofType:@"plist"];
        _configContent = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}

- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNames:(NSString *)fallbackPlistName {
    self = [self initWithPlistNamed:plistName];
    if (self) {
        NSString *defaultPath = [[NSBundle bundleForClass:[self class]] pathForResource:fallbackPlistName ofType:@"plist"];
        _defaultContentConfig = [NSDictionary dictionaryWithContentsOfFile:defaultPath];
    }
    return self;
}

- (id)readPropertyWithKey:(NSString *)key {
    id result = _configContent[key];
    if (!result) {
        result = _defaultContentConfig[key];
    }
    return result;
}

@end
