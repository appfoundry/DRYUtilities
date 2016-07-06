//
// Created by Joris Dubois on 04/07/16.
//

#import "UIViewController+DRYViewControllerContainment.h"

@implementation UIViewController (DRYViewControllerContainment)

- (void)dryAddSubController:(UIViewController *)controller withContainer:(UIView *)container applyingConstraintsFromBlock:(ConstraintBlock)constraintBlock {
	[self addChildViewController:controller];
	[container addSubview:controller.view];
	if (constraintBlock != NULL) {
		constraintBlock(controller.view, container);
	}
	[controller didMoveToParentViewController:self];
}

- (void)dryAddSubControllerUsingEqualFrames:(UIViewController *)controller withContainer:(UIView *)container {
	[self dryAddSubController:controller withContainer:container applyingConstraintsFromBlock:^(UIView *controllerView, UIView *containerView) {
		controllerView.frame = containerView.bounds;
	}];
}

- (void)dryAddSubControllerUsingEdgeConstraints:(UIViewController *)controller withContainer:(UIView *)container {
	[self dryAddSubController:controller withContainer:container applyingConstraintsFromBlock:^(UIView *controllerView, UIView *containerView) {
        controllerView.translatesAutoresizingMaskIntoConstraints = NO;
		[containerView addConstraints:@[
			[NSLayoutConstraint constraintWithItem:controllerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
			[NSLayoutConstraint constraintWithItem:controllerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
			[NSLayoutConstraint constraintWithItem:controllerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTop multiplier:1 constant:0],
			[NSLayoutConstraint constraintWithItem:controllerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
		]];
	}];
}

- (void)dryRemoveSubController:(UIViewController *) controller {
	[controller willMoveToParentViewController:nil];
	[controller.view removeFromSuperview];
	[controller removeFromParentViewController];
}

@end