//
//  DRYBaseDynamicPropertyProvider.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>

@protocol DRYResourceReader;

@interface DRYBaseDynamicPropertyProvider : NSObject

- (instancetype)initWithResourceReader:(id<DRYResourceReader>)reader;

@end
