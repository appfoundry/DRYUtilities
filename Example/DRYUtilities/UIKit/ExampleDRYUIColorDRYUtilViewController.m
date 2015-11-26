//
// Created by Willem Van Pelt on 26/11/15.
//

#import <DRYUtilities/UIColor+DRYUtil.h>
#import "ExampleDRYUIColorDRYUtilViewController.h"

@interface ExampleDRYUIColorDRYUtilViewController()
@property (weak, nonatomic) IBOutlet UITextField *hexTextField;
@property (weak, nonatomic) IBOutlet UIView *coloredView;

@end

@implementation ExampleDRYUIColorDRYUtilViewController {

}

-(void)viewDidLoad {
    [super viewDidLoad];
    _hexTextField.text = @"#113399";
}

- (IBAction)colorize:(id)sender {
    _coloredView.backgroundColor = [UIColor dryColorFromRGBHexString:_hexTextField.text];
}
@end