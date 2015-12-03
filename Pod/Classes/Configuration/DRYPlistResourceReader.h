//
//  DRYPlistResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>
#import "DRYResourceReader.h"

/**
A resource reader which reads data from a plist in the application bundle.
*/
@interface DRYPlistResourceReader : NSObject<DRYResourceReader>

/**
 Create a reader that reads data from the plist file with given name. The plist file is taken from the bundle to which this class belongs.
 
 @param plistName the base name (without extension!) of the plist file as present in the bundle which this class belongs to.
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName;

/**
 Create a reader that reads data from the plist file with given name. The plist file is taken from the given bundle.

 @param plistName the base name (without extension!) of the plist file as present in the given bundle.
 @param bundle the bundle in which the plist file can be found
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName inBundle:(NSBundle *)bundle;

/**
 Create reader that reads data from the plist file with given name and from the given fallback.
 
 The fallback can be used to read values when such values cannot be found in the given plist.
 
 @param plistName the base name (without extension!) of the plist file as present in the bundle which this class belongs to.
 @param fallbackPlistName the base name (without extension!) of the fallback plist file as present in the bundle which this class belongs to.
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNamed:(NSString *)fallbackPlistName;

/**
 Create reader that reads data from the plist file with given name and from the given fallback.
 
 The fallback can be used to read values when such values cannot be found in the given plist.
 
 @param plistName the base name (without extension!) of the plist file as present in the given bundle.
 @param fallbackPlistName the base name (without extension!) of the fallback plist file as present in the given bundle.
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNamed:(NSString *)fallbackPlistName inBundle:(NSBundle *)bundle;
/**
 Create reader that reads data from the plist file with given name and from the given fallback reader.
 
 The fallback reader can be used to read values when such values cannot be found in the given plist.
 
 @param plistName the base name (without extension!) of the plist file as present in the given bundle.
 @param resourceReader the resource reader, to read values from when they cannot be found in the given plist.
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName fallbackResourceReader:(id<DRYResourceReader>)resourceReader;

/**
 Create reader that reads data from the plist file with given name and from the given fallback reader. The plist file is taken from the given bundle.
 
 The fallback reader can be used to read values when such values cannot be found in the given plist.
 
 @param plistName the base name (without extension!) of the plist file as present in the given bundle.
 @param resourceReader the resource reader, to read values from when they cannot be found in the given plist.
 @param bundle the bundle in which the plist file can be found
 */
- (instancetype)initWithPlistNamed:(NSString *)plistName fallbackResourceReader:(id<DRYResourceReader>)resourceReader inBundle:(NSBundle *)bundle;
@end
