//
//  DRYBaseDynamicPropertyProvider.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>

@protocol DRYResourceReader;

/**
This class provides a way to expose data read from a DRYResourceReader as dynamic properties.

You should extend this class or at least provide a category for it, which declares the read-only properties. The reader
will be queried for data with the exact same key as the name of that property. The implementation of your class or
category should declare these properties as dynamic (you should not try to implement your own getters).

For an example, please refer to the tests or the DRYUtilities example app.
*/
@interface DRYBaseDynamicPropertyProvider : NSObject

/**
Initialize the property provider with the given resource reader.

@param reader The resource reader, which serves as the backing store for the defined properties.
*/
- (instancetype)initWithResourceReader:(id<DRYResourceReader>)reader;

@end
