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
    char bytes[2] = {0, 255};
    NSData *data = [NSData dataWithBytes:bytes length:2];
    
    _convertedTextLabel.text = [NSString dryStringWithHexFromData:data];
    
}
@end