//
//  NSString+DRYUtil.m
//  Pods
//
//  Created by Joris Dubois on 02/07/15.
//
//

#import "NSString+DRYUtil.h"

@implementation NSString (DRYUtil)

- (BOOL)dryIsNotBlank {
    if([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        return false;
    }
    return true;
}

@end
