//
// Created by Willem Van Pelt on 25/11/15.
//

#import "ExampleDRYNSStringHexViewController.h"
#import "NSString+DRYHex.h"

@interface ExampleDRYNSStringHexViewController()
@property (weak, nonatomic) IBOutlet UILabel *convertedTextLabel;


@end

@implementation ExampleDRYNSStringHexViewController {

}
- (IBAction)convertToHexString:(id)sender {
    char bytes[3] = {0, 1, 2};
    NSData *data = [NSData dataWithBytes:bytes length:3];
    
    _convertedTextLabel.text = [NSString dryStringWithHexFromData:data];
    
}
@end