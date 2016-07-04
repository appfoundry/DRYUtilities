//
// Created by Joris Dubois on 04/07/16.
//

#import <UIKit/UIKit.h>

typedef void(^ConstraintBlock)(UIView *controllerView, UIView *containerView);

/**
 category to facilitate viewcontroller containment. Using the add and remove methods will make sure that the correct lifecycle methods will be called.
 This category is not meant to be used when your parent viewcontroller uses transitions.
 */
@interface UIViewController (DRYViewControllerContainment)

/**
 Add the given controller as a child controller to the receiver while adding the given controller's view as subview to the given container and constraining these views using the given constraintBlock.

 @param controller The controller to be added as child controller.
 @param container The view that should serve as parent view of the given controller's view.
 @param constraintBlock A block that can apply constraints to the given views.
 */
- (void)dryAddSubController:(UIViewController *)controller withContainer:(UIView *)container applyingConstraintsFromBlock:(ConstraintBlock)constraintBlock;

/**
 Add the given controller as a child controller to the receiver while adding the given controller's view as subview to the given container making the controller views frame equal to the container's bounds.

 @param controller The controller to be added as child controller.
 @param container The view that should serve as parent view of the given controller's view.
 */
- (void)dryAddSubControllerUsingEqualFrames:(UIViewController *)controller withContainer:(UIView *)container;

/**
 Add the given controller as a child controller to the receiver while adding the given controller's view as subview to the given container making the controller views edges equal to the container's edges.

 @param controller The controller to be added as child controller.
 @param container The view that should serve as parent view of the given controller's view.
 */
- (void)dryAddSubControllerUsingEdgeConstraints:(UIViewController *)controller withContainer:(UIView *)container;

/**
 Remove the given controller from its parent controller.

 @param controller The controller to be removed from the receiver.
 */
- (void)dryRemoveSubController:(UIViewController *)controller;

@end