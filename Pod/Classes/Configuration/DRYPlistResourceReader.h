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

- (instancetype)initWithPlistNamed:(NSString *)plistName;
- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNamed:(NSString *)fallbackPlistName;

@end
