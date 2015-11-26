//
//  ExampleTableViewController.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 24/11/15.
//

#import "ExampleTableViewController.h"
#import "UIImage+AFImage.h"
#import "UIColor+AFColor.h"

@interface ExampleTableViewController ()

@end

@implementation ExampleTableViewController {
    NSArray *_exampleItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DRYUtilities Examples";

    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage afLogo]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(gotoWebsite:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    self.view.backgroundColor = [UIColor afGreenColor];
    self.tableView.separatorColor = [UIColor afBlueColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"exampleItemCell"];

    [self _loadExampleItems];
}

- (void)gotoWebsite:(id)gotoWebsite {
    NSURL *url = [NSURL URLWithString:@"http://www.appfoundry.be/"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)_loadExampleItems {
    _exampleItems = @[
            @{@"name" : @"Foundation",
                    @"utilities" : @[
                    @{@"label" : @"NSObject/NSNull DRYNSNullSupport", @"segue" : @"goToDRYNSNullSupport"},
                    @{@"label" : @"NSString DRYHex", @"segue" : @"goToDRYHex"},
                    @{@"label" : @"NSString DRYTemplateReplacement", @"segue" : @"goToDRYTemplateReplacement"}]
            },
            @{@"name" : @"UIKit",
                    @"utilities" : @[
                    @{@"label" : @"UIKit: UIView DRYLoadFromNib", @"segue" : @"goToDRYNib"}]
            },
            @{@"name" : @"Configuration",
                    @"utilities" : @[
                    @{@"label" : @"Configuration utilities", @"segue" : @"goToDRYResourceReader"}]
            }
    ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_exampleItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_exampleItems[(NSUInteger) section] valueForKey:@"utilities"] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_exampleItems[(NSUInteger) section] valueForKey:@"name"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exampleItemCell" forIndexPath:indexPath];

    cell.textLabel.text = [[_exampleItems[(NSUInteger) indexPath.section] valueForKey:@"utilities"][(NSUInteger) indexPath.row] objectForKey:@"label"];
    cell.textLabel.textColor = [UIColor afBlueColor];
    cell.backgroundColor = [UIColor afGreenColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:[[_exampleItems[(NSUInteger) indexPath.section] valueForKey:@"utilities"][(NSUInteger) indexPath.row] objectForKey:@"segue"] sender:self];
}


@end
