//
//  DRYDictionaryResourceReader.m
//  Pods
//
//  Created by Michael Seghers on 03/12/15.
//
//

#import "DRYDictionaryResourceReader.h"

@interface DRYDictionaryResourceReader () {
    NSDictionary *_dictionary;
    id<DRYResourceReader> _fallbackResourceReader;
}

@end

@implementation DRYDictionaryResourceReader

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    return [self initWithDictionary:dictionary fallbackResourceReader:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary fallbackResourceReader:(id<DRYResourceReader>)fallbackResourceReader {
    self = [super init];
    if (self) {
        _dictionary = dictionary;
        _fallbackResourceReader = fallbackResourceReader;
    }
    return self;
}

- (id)readPropertyWithKey:(NSString *)key {
    id result = _dictionary[key];
    if (!result) {
        result = [_fallbackResourceReader readPropertyWithKey:key];
    }
    return result;
}

@end
