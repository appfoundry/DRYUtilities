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
    _textToResolve.text = @"Hello {name}, you live in __location__";
    _valueOne.text = @"world";
    _valueTwo.text = @"the universe";
}

- (IBAction)resolveText:(id)sender {
    NSDictionary *valueDictionary = @{
                                      @"name" : _valueOne.text,
                                      @"location" : _valueTwo.text
                                      };
    
    //Resolve the template with a dictionary using the standard template notation: {placeholderName}
    _resolvedTextLabel.text = [_textToResolve.text dryStringByReplacingTemplatesWithValuesFromDictionary:valueDictionary];
    
    //Resolve the template with a dictionary using a custom template notation like __placeholderName__
    _customResolvedTextLabel.text = [_textToResolve.text dryStringByReplacingTemplatesWithValuesFromDictionary:valueDictionary
                                                                                            withTemplatePrefix:@"__"
                                                                                                templateSuffix:@"__"];
}

@end
