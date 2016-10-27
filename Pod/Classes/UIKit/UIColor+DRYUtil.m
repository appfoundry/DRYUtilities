//
// Created by Willem Van Pelt on 25/11/15.
//

#import <UIKit/UIKit.h>
#import "UIColor+DRYUtil.h"


@implementation UIColor (DRYUtil)

+ (UIColor *)dryColorFromRGBHexString:(NSString *)colorString {
    UIColor *color = nil;
    if ([self _possibleRGBHexString:colorString] || [self _possibleRGBAHexString:colorString]) {
        int r, g, b;
        int a = 255;
       
        [self _scanColorString:colorString R:&r G:&g B:&b A:&a];
        
        if (r >= 0 && r < 256 && g >= 0 && g < 256 && b >= 0 && b < 256 && a < 256) {
            color = [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:(a / 225.0)];
        }
    }
    return color;
}

+ (BOOL)_possibleRGBHexString:(NSString *)colorString {
    return ([colorString hasPrefix:@"#"] && (colorString.length == 7 || colorString.length == 4));
}

+ (BOOL)_possibleRGBAHexString:(NSString *)colorString {
    return ([colorString hasPrefix:@"#"] && (colorString.length == 9 || colorString.length == 5));
}

+ (void)_scanColorString:(NSString *)colorString R:(int *)red G:(int *)green B:(int *)blue A:(int *)alpha  {
    if ([self _possibleRGBHexString:colorString]) {
        [self _scanRGBString:colorString R:red G:green B:blue];
    } else if ([self _possibleRGBAHexString:colorString]) {
        [self _scanRGBAString:colorString R:red G:green B:blue A:alpha];
    }
}

+ (void)_scanRGBString:(NSString *)colorString R:(int *)red G:(int *)green B:(int *)blue {
    const char *colorUTF8String = [colorString UTF8String];
    if (colorString.length == 7) {
        sscanf(colorUTF8String, "#%2x%2x%2x", red, green, blue);
    } else if (colorString.length == 4) {
        sscanf(colorUTF8String, "#%1x%1x%1x", red, green, blue);
        *red = (*red << 4) + *red;
        *green = (*green << 4) + *green;
        *blue = (*blue << 4) + *blue;
    }
}

+ (void)_scanRGBAString:(NSString *)colorString R:(int *)red G:(int *)green B:(int *)blue A:(int *)alpha {
    const char *colorUTF8String = [colorString UTF8String];
    if (colorString.length == 9) {
        sscanf(colorUTF8String, "#%2x%2x%2x%2x", red, green, blue, alpha);
    } else if (colorString.length == 5) {
        sscanf(colorUTF8String, "#%1x%1x%1x%1x", red, green, blue, alpha);
        *red = (*red << 4) + *red;
        *green = (*green << 4) + *green;
        *blue = (*blue << 4) + *blue;
        *alpha = (*alpha << 4) + *alpha;
    }
}

+ (UIColor *)dryColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

@end