//
//  ExampleDRYLoadFromNibController.m
//  DRYUtilities
//
//  Created by Michael Seghers on 02/10/2015.
//  Copyright (c) 2014 Michael Seghers. All rights reserved.
//

#import "ExampleDRYLoadFromNibController.h"
#import "UIView+DRYLoadFromNib.h"

@interface ExampleDRYLoadFromNibController ()

@property (nonatomic, weak) IBOutlet UIView *topViewContainer;
@property (nonatomic, weak) IBOutlet UIView *bottomLeftViewContainer;
@property (nonatomic, weak) IBOutlet UIView *bottomRightViewContainer;

@property (nonatomic, weak) IBOutlet UIView *subView;

@end

@implementation ExampleDRYLoadFromNibController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIView *viewLoadedFromNib = [UIView dryViewWithNibName:@"SimpleView"];
    viewLoadedFromNib.frame = self.topViewContainer.bounds;
    [self.topViewContainer addSubview:viewLoadedFromNib];
    
    UIView *greenView = [UIView dryViewWithNibName:@"SimpleViewWithOwner" bundle:nil owner:self tag:1];
    self.subView.frame = self.bottomLeftViewContainer.bounds;
    [self.subView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    greenView.frame = self.bottomRightViewContainer.bounds;

    [self.bottomLeftViewContainer addSubview:self.subView];
    [self.bottomRightViewContainer addSubview:greenView];
}

@end
