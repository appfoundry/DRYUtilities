//
//  UIView+DRYLoadFromNib.m
//  Pods
//
//  Created by Michael Seghers on 11/02/15.
//
//

#import "UIView+DRYLoadFromNib.h"

@implementation UIView (DRYLoadFromNib)

+ (instancetype)dryViewWithNibName:(NSString *)nibName {
    return [self dryViewWithNibName:nibName bundle:nil];
}

+ (instancetype)dryViewWithNibName:(NSString *)nibName tag:(NSInteger)tag {
    return [self dryViewWithNibName:nibName bundle:nil tag:tag];
}

+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil {
    return [self dryViewWithNibName:nibName bundle:nibBundleOrNil owner:nil];
}

+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil tag:(NSInteger)tag {
    return [self dryViewWithNibName:nibName bundle:nibBundleOrNil owner:nil tag:tag];
}

+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner {
    return [self dryViewWithNibName:nibName bundle:nibBundleOrNil owner:owner tag:NSNotFound];
}

+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner tag:(NSInteger)tag {
    NSBundle *actualBundle = [self _bundleOrMainBundle:nibBundleOrNil];

    NSArray *nibObjects = [actualBundle loadNibNamed:nibName owner:owner options:nil];
    UIView *view = [self _findViewOfOwnTypeInArray:nibObjects tag:tag];
    return view;
}

+ (UIView *)_findViewOfOwnTypeInArray:(NSArray *)nibObjects tag:(NSInteger)tag {
    UIView *view = nil;
    for (id nibObject in nibObjects) {
        if ([nibObject isKindOfClass:[self class]]) {
            if (tag != NSNotFound) {
                if (((UIView *)nibObject).tag == tag) {
                    view = nibObject;
                    break;
                }
            } else {
                view = nibObject;
                break;
            }
        }
    }
    return view;
}

+ (NSBundle *)_bundleOrMainBundle:(NSBundle *)nibBundleOrNil {
    NSBundle *actualBundle = nibBundleOrNil;
    if (!actualBundle) {
        actualBundle = [NSBundle mainBundle];
    }
    return actualBundle;
}

@end
