//
//  UIColor+DRYHex.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 26/11/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "DRYUtilitiesTests.h"
#import "UIColor+DRYUtil.h"

@interface UIColor_DRYUtil : XCTestCase

@end

@implementation UIColor_DRYUtil

- (void)testHexStringIsSameAsRgbColor {
    UIColor *color = [UIColor dryColorFromRGBHexString:@"#FF00FF"];
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    assertThatDouble(components[0], is(equalTo(@(1))));
    assertThatDouble(components[1], is(equalTo(@(0))));
    assertThatDouble(components[2], is(equalTo(@(1))));
    assertThatDouble(CGColorGetAlpha(color.CGColor), is(equalTo(@(1))));
}

- (void)testColorWithRGBValues {
    UIColor *color = [UIColor dryColorWithR:255 G:0 B:255 A:1.0];
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    assertThatDouble(components[0], is(equalTo(@(1))));
    assertThatDouble(components[1], is(equalTo(@(0))));
    assertThatDouble(components[2], is(equalTo(@(1))));
    assertThatDouble(CGColorGetAlpha(color.CGColor), is(equalTo(@(1))));

}

@end
