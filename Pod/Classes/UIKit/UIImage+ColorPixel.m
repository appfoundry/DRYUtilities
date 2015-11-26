//
// Created by Willem Van Pelt on 25/11/15.
//

#import "UIImage+ColorPixel.h"


@implementation UIImage (ColorPixel)

+ (UIImage *) dryImageWithColor:(UIColor *) color {
    return [UIImage dryImageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *) dryImageWithColor:(UIColor *)color size:(CGSize) size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end