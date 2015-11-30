//
//  UIImage+ColorPixelTest.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 27/11/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRYUtilitiesTests.h"
#import "UIImage+ColorPixel.h"

@interface UIImage_ColorPixelTest : XCTestCase

@end

@implementation UIImage_ColorPixelTest

- (void)testDryImageWithColorPerformance {
    [self measureBlock:^{
        [UIImage dryImageWithColor:[UIColor redColor] size:CGSizeMake(10, 10)];
    }];
}

@end