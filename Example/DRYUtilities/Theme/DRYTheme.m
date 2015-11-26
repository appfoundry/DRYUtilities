//
// Created by Willem Van Pelt on 25/11/15.
//

#import "DRYTheme.h"
#import "UIColor+DRYUtil.h"
#import "UIImage+ColorPixel.h"
#import "UIColor+AFColor.h"

@implementation DRYTheme {

}

- (id)init {
    self = [super init];
    if (self) {
        [self _customizeTableView];
        [self _customizeAppearanceForNavigationBar];
    }
    return self;
}

- (void)_customizeTableView {
    UITableViewCell *cellAppearance = [UITableViewCell appearance];
    cellAppearance.backgroundColor = [UIColor afGreenColor];

}

- (void) _customizeAppearanceForNavigationBar {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];

    [navigationBarAppearance setBackgroundImage:[UIImage dryImageWithColor:[UIColor afOrangeColor]] forBarMetrics:UIBarMetricsDefault];

    [navigationBarAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
}

@end