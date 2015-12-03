//
//  DRYJsonResourceReader.m
//  Pods
//
//  Created by Michael Seghers on 03/12/15.
//
//

#import "DRYJsonResourceReader.h"
#import "DRYDictionaryResourceReader.h"

@interface DRYJsonResourceReader () {
    DRYDictionaryResourceReader *_dictionaryResourceReader;
}

@end

@implementation DRYJsonResourceReader

- (instancetype)initWithJsonNamed:(NSString *)jsonName {
    return [self initWithJsonNamed:jsonName inBundle:[NSBundle bundleForClass:[self class]]];
}

- (instancetype)initWithJsonNamed:(NSString *)jsonName inBundle:(NSBundle *)bundle {
    return [self initWithJsonNamed:jsonName fallbackResourceReader:nil inBundle:bundle];
}

- (instancetype)initWithJsonNamed:(NSString *)jsonName fallbackResourceReader:(id<DRYResourceReader>)resourceReader {
    return [self initWithJsonNamed:jsonName fallbackResourceReader:resourceReader inBundle:[NSBundle bundleForClass:[self class]]];
}

- (instancetype)initWithJsonNamed:(NSString *)jsonName fallbackResourceReader:(id<DRYResourceReader>)resourceReader inBundle:(NSBundle *)bundle {
    self = [super init];
    if (self) {
        NSString *path = [bundle pathForResource:jsonName ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (![jsonObject isKindOfClass:[NSDictionary class]]) {
            return nil;
        }
        
        _dictionaryResourceReader = [[DRYDictionaryResourceReader alloc] initWithDictionary:jsonObject fallbackResourceReader:resourceReader];
    }
    return self;
}

- (id)readPropertyWithKey:(NSString *)key {
    return [_dictionaryResourceReader readPropertyWithKey:key];
}

@end
