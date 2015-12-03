//
//  DRYJsonResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 03/12/15.
//
//

#import <Foundation/Foundation.h>
#import "DRYResourceReader.h"

/**
 A resource reader which reads data from a json file in the application bundle.
 */
@interface DRYJsonResourceReader : NSObject<DRYResourceReader>

/**
 Create a reader that reads data from the json file with given name. The json file file is taken from the bundle to which this class belongs.
 
 @param jsonName the base name (without extension!) of the json file as present in the bundle which this class belongs to.
 */
- (instancetype)initWithJsonNamed:(NSString *)jsonName;

/**
 Create a reader that reads data from the json file with given name. The json file is taken from the given bundle.
 
 @param jsonName the base name (without extension!) of the json file as present in the given bundle.
 @param bundle the bundle in which the json file can be found
 */
- (instancetype)initWithJsonNamed:(NSString *)jsonName inBundle:(NSBundle *)bundle;

/**
 Create a reader that reads data from the json file with given name and from the given fallback reader.
 
 The fallback reader can be used to read values when such values cannot be found in the given json.
 
 @param jsonName the base name (without extension!) of the json file as present in the given bundle.
 @param resourceReader the resource reader, to read values from when they cannot be found in the given json.
 */
- (instancetype)initWithJsonNamed:(NSString *)jsonName andFallbackReader:(id<DRYResourceReader>)resourceReader;

/**
 Create a reader that reads data from the json file with given name and from the given fallback reader. The json file is taken from the given bundle.
 
 The fallback reader can be used to read values when such values cannot be found in the given json.
 
 @param jsonName the base name (without extension!) of the json file as present in the given bundle.
 @param resourceReader the resource reader, to read values from when they cannot be found in the given json.
 @param bundle the bundle in which the json file can be found
 */
- (instancetype)initWithJsonNamed:(NSString *)jsonName andFallbackReader:(id<DRYResourceReader>)resourceReader inBundle:(NSBundle *)bundle;
@end
