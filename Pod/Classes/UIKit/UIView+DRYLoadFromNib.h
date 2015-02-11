//
//  UIView+DRYLoadFromNib.h
//  Pods
//
//  Created by Michael Seghers on 11/02/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (DRYLoadFromNib)

+ (instancetype)dryViewWithNibName:(NSString *)nibName;
+ (instancetype)dryViewWithNibName:(NSString *)nibName tag:(NSInteger) tag;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil tag:(NSInteger)tag;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner tag:(NSInteger)tag;


@end
