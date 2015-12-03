//
//  NSString+DRYUtil.h
//  Pods
//
//  Created by Joris Dubois on 02/07/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (DRYUtil)

/**
 Returns YES if the string is not blank. A blank string is either nil, empty, or only contains whitespaces.
 */
- (BOOL)dryIsNotBlank;

@end
