//
// Created by Willem Van Pelt on 25/11/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (DRYUtil)

/*
 * Returns a UIColor instance based on the provided RGB hex string. The string should be prefixed with a #.
 * eg: #000000 -> black, #ffffff -> white
 * */
+ (UIColor *)dryColorFromRGBHexString:(NSString *) colorString;

/*
 * Returns a UIColor instance based on a red (R), green (G), blue (B) and alphe (A) value
 * */
+ (UIColor *)dryColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat) alpha;

@end