//
// Created by Willem Van Pelt on 24/11/15.
// Copyright (c) 2015 Michael Seghers. All rights reserved.
//

#import "ExampleConfigurationViewController.h"
#import "DRYPlistResourceReader.h"
#import "DRYBaseDynamicPropertyProvider.h"
#import "ExampleDynamicPropertyProvider.h"

@interface ExampleConfigurationViewController ()

@property(weak, nonatomic) IBOutlet UILabel *firstPropertyLabel;
@property(weak, nonatomic) IBOutlet UILabel *secondPropertyLabel;

@end

/**
 * This controller show the working of the DRYResourceReader.
 * It can either be used standalone or in combination with a DRYBaseDynamicPropertyProvider to make you code even DRY'er
 */
@implementation ExampleConfigurationViewController {
    ExampleDynamicPropertyProvider *_propertyProvider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _init];
}

- (void)_init {

    //Instantiate a DRYResourceReader based on .plist files
    //Configuration.plist is the file containing the properties for this configuration
    //DefaultConfiguration.plist is the file containing all the properties including the ones that aren't provided in the Configuration.plist file
    //DRYResourceReader can also be used without a fallback plist file
    id <DRYResourceReader> reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"Configuration" andFallbackPlistNamed:@"DefaultConfiguration"];

    //To get even DRY'er you can use a DRYBaseDynamicPropertyProvider
    //This allows you to define your properties as dynamic properties in a subclass of DRYBaseDynamicPropertyProvider
    _propertyProvider = [[ExampleDynamicPropertyProvider alloc] initWithResourceReader:reader];

    NSLog(@"First property value using [reader readPropertyWithKey:@\"firstProperty\"] : %@", [reader readPropertyWithKey:@"firstProperty"]);
    NSLog(@"First property value using [reader readPropertyWithKey:@\"secondProperty\"] : %@", [reader readPropertyWithKey:@"secondProperty"]);

    NSLog(@"First property value using _propertyProvider.firstProperty : %@", _propertyProvider.firstProperty);
    NSLog(@"First property value using _propertyProvider.secondProperty : %@", _propertyProvider.secondProperty);
}

- (IBAction)loadFirstProperty:(id)sender {
    _firstPropertyLabel.text = _propertyProvider.firstProperty;
}

- (IBAction)loadSecondProperty:(id)sender {
    _secondPropertyLabel.text = _propertyProvider.secondProperty;
}

@end