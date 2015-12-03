//
//  DRYPlistResourceReader.m
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import "DRYPlistResourceReader.h"
#import "DRYDictionaryResourceReader.h"

@interface DRYPlistResourceReader () {
    DRYDictionaryResourceReader *_dictionaryResourceReader;
}

@end


@implementation DRYPlistResourceReader

- (instancetype)initWithPlistNamed:(NSString *)plistName {
    return [self initWithPlistNamed:plistName inBundle:[NSBundle bundleForClass:[self class]]];
}

- (instancetype)initWithPlistNamed:(NSString *)plistName inBundle:(NSBundle *)bundle {
    return [self initWithPlistNamed:plistName fallbackResourceReader:nil inBundle:bundle];
}

- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNamed:(NSString *)fallbackPlistName {
    return [self initWithPlistNamed:plistName andFallbackPlistNamed:fallbackPlistName inBundle:[NSBundle bundleForClass:[self class]]];
}

- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNamed:(NSString *)fallbackPlistName inBundle:(NSBundle *)bundle {
    return [self initWithPlistNamed:plistName fallbackResourceReader:[[DRYPlistResourceReader alloc] initWithPlistNamed:fallbackPlistName inBundle:bundle] inBundle:bundle];
}

- (instancetype)initWithPlistNamed:(NSString *)plistName fallbackResourceReader:(id<DRYResourceReader>)resourceReader {
    return [self initWithPlistNamed:plistName fallbackResourceReader:resourceReader inBundle:[NSBundle bundleForClass:[self class]]];
}

- (instancetype)initWithPlistNamed:(NSString *)plistName fallbackResourceReader:(id<DRYResourceReader>)resourceReader inBundle:(NSBundle *)bundle {
    self = [super init];
    if (self) {
        NSString *path = [bundle pathForResource:plistName ofType:@"plist"];
        _dictionaryResourceReader = [[DRYDictionaryResourceReader alloc] initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path] fallbackResourceReader:resourceReader];
    }
    return self;
}

- (id)readPropertyWithKey:(NSString *)key {
    return [_dictionaryResourceReader readPropertyWithKey:key];
}

@end
