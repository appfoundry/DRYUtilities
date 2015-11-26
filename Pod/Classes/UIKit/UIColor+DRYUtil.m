//
// Created by Willem Van Pelt on 25/11/15.
//

#import "UIColor+DRYUtil.h"


@implementation UIColor (DRYUtil)

+ (UIColor *)dryColorFromRGBHexString:(NSString *)colorString {
    UIColor *color = nil;
    if ([colorString hasPrefix:@"#"] && (colorString.length == 7 || colorString.length == 4)) {
        const char *colorUTF8String = [colorString UTF8String];
        int r, g, b;
        if (colorString.length == 7) {
            sscanf(colorUTF8String, "#%2x%2x%2x", &r, &g, &b);
        } else {
            sscanf(colorUTF8String, "#%1x%1x%1x", &r, &g, &b);
            r = (r << 4) + r;
            g = (g << 4) + g;
            b = (b << 4) + b;
        }
        if (r >= 0 && r < 256 && g >= 0 && g < 256 && b >= 0 && b < 256) {
            color = [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1.0];
        }
    }
    return color;
}

+ (UIColor *)dryColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}
@end