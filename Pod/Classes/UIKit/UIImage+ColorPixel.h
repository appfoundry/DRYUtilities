//
// Created by Willem Van Pelt on 25/11/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (ColorPixel)

/*
 * Returns a UIImage instance using a solid color as fill for the image
 * */
+ (UIImage *)dryImageWithColor:(UIColor *)color;

/*
 * Returns a UIImage instance sized to the provided size using a solid color as fill for the image
 * */
+ (UIImage *)dryImageWithColor:(UIColor *)color size:(CGSize)size;
@end