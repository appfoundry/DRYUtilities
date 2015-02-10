//
//  DRYResourceReader.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <Foundation/Foundation.h>

@protocol DRYResourceReader <NSObject>

- (id)readPropertyWithKey:(NSString *)key;

@end
