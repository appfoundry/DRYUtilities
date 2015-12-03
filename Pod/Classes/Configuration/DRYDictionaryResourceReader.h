//
//  DRYDictionaryResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 03/12/15.
//
//

#import <Foundation/Foundation.h>
#import "DRYResourceReader.h"

/**
 A resource reader, which reads values from a dictionary.
 */
@interface DRYDictionaryResourceReader : NSObject<DRYResourceReader>

/**
 Creates a reader, based on the given dictionary. The keys in the dictionary are used as property names for the readPropertyWithKey: method.
 
 @param dictionary the underlying dictionary to read properties from
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 Creates a reader, based on the given dictionary. The keys in the dictionary are used as property names for the readPropertyWithKey: method.
 
 @param dictionary the underlying dictionary to read properties from
 @param fallbackResourceReader the fallback reader used when a property cannot be found in the underlying dictionary
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary fallbackResourceReader:(id<DRYResourceReader>)fallbackResourceReader;

@end
