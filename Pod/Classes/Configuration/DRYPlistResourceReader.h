//
//  DRYPlistResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>
#import "DRYResourceReader.h"

@interface DRYPlistResourceReader : NSObject<DRYResourceReader>

- (instancetype)initWithPlistNamed:(NSString *)plistName;
- (instancetype)initWithPlistNamed:(NSString *)plistName andFallbackPlistNames:(NSString *)fallbackPlistName;

@end
