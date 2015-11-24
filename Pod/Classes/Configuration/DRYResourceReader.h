//
//  DRYResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>

/**
A resource reader is capable of finding so called properties from a resource based on a given key. Examples
could be a reader which reads the values from a plist or json file.
*/
@protocol DRYResourceReader <NSObject>

/**
Read a property from the resource, identified by the given key.
*/
- (id)readPropertyWithKey:(NSString *)key;

@end
