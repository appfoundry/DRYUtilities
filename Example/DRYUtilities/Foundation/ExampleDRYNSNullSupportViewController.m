//
//  ExampleDRYNSNullSupportViewController.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 25/11/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "ExampleDRYNSNullSupportViewController.h"
#import "NSObject+DRYNSNullSupport.h"

@interface ExampleDRYNSNullSupportViewController ()
@property(weak, nonatomic) IBOutlet UITextField *jsonTextField;
@property(weak, nonatomic) IBOutlet UILabel *valueLabel;
@property(weak, nonatomic) IBOutlet UILabel *dryValueLabel;

@end

@implementation ExampleDRYNSNullSupportViewController

- (IBAction)deserialize:(id)sender {
    NSString *jsonString = _jsonTextField.text;
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    NSString *country = [json valueForKey:@"country"];
    NSString *dryCountry = [[json valueForKey:@"country"] dryValueOrNil];

    _valueLabel.text = [NSString stringWithFormat:@"Country: [NSNull *] %@", country];
    _dryValueLabel.text = [NSString stringWithFormat:@"Country: [NSString *] %@", dryCountry];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _jsonTextField.text = @"{\"country\": null}";
}

@end
