//
// Created by Willem Van Pelt on 25/11/15.
//

#import <DRYUtilities/UIColor+DRYUtil.h>
#import <UIKit/UIKit.h>
#import "UIColor+AFColor.h"

@implementation UIColor (AFColor)

+ (UIColor *)afOrangeColor {
    return [UIColor dryColorFromRGBHexString:@"#f05528"];
}

+ (UIColor *)afGreenColor {
    return [UIColor dryColorFromRGBHexString:@"#1abc9c"];
}

+ (UIColor *)afBlueColor {
    return [UIColor dryColorFromRGBHexString:@"#2c3e50"];
}

@end