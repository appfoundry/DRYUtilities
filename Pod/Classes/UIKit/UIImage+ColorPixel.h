//
// Created by Willem Van Pelt on 25/11/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (ColorPixel)

/*
 * Returns a UIImage instance with dimension 1x1 using a solid color as fill for the image.
 */
+ (UIImage *)dryImageWithColor:(UIColor *)color;

/*
 * Returns a UIImage instance with the given dimensions using a solid color as fill for the image.
 */
+ (UIImage *)dryImageWithColor:(UIColor *)color size:(CGSize)size;
@end