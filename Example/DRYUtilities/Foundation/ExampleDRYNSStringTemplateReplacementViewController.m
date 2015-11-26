//
//  ExampleDRYNSStringTemplateReplacementViewController.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 25/11/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "ExampleDRYNSStringTemplateReplacementViewController.h"
#import "NSString+DRYTemplateReplacement.h"

@interface ExampleDRYNSStringTemplateReplacementViewController ()
@property(weak, nonatomic) IBOutlet UITextField *textToResolve;
@property(weak, nonatomic) IBOutlet UITextField *valueOne;
@property(weak, nonatomic) IBOutlet UITextField *valueTwo;
@property(weak, nonatomic) IBOutlet UILabel *resolvedTextLabel;
@property(weak, nonatomic) IBOutlet UILabel *customResolvedTextLabel;

@end

@implementation ExampleDRYNSStringTemplateReplacementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textToResolve.text = @"Hi {name}, you live in __country__";
    _valueOne.text = @"world";
    _valueTwo.text = @"all countries";
}

- (IBAction)resolveText:(id)sender {
    //Resolve the template with a dictionary using the standard template notation: {placeholderName}
    _resolvedTextLabel.text = [_textToResolve.text dryStringByReplacingTemplatesWithValuesFromDictionary:@{@"name" : _valueOne.text}];

    //Resolve the template with a dictionary using a custom template notation like __placeholderName__
    _customResolvedTextLabel.text = [_textToResolve.text dryStringByReplacingTemplatesWithValuesFromDictionary:@{@"country" : _valueTwo.text}
                                                                                            withTemplatePrefix:@"__"
                                                                                                templateSuffix:@"__"];
}

@end
