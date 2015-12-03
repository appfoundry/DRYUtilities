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

/**
 Takes the first view of the receivers type from the nib/xib with the given name.
 */
+ (instancetype)dryViewWithNibName:(NSString *)nibName;
/**
 Takes the first view of the receivers type from the nib/xib with the given name and the given tag.
 */
+ (instancetype)dryViewWithNibName:(NSString *)nibName tag:(NSInteger) tag;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil tag:(NSInteger)tag;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner;
+ (instancetype)dryViewWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil owner:(id)owner tag:(NSInteger)tag;


@end
