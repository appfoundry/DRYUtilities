//
//  DRYDictionaryResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 03/12/15.
//
//

#import <Foundation/Foundation.h>
#import "DRYResourceReader.h"

@interface DRYDictionaryResourceReader : NSObject<DRYResourceReader>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary fallbackResourceReader:(id<DRYResourceReader>)fallbackResourceReader;

@end
