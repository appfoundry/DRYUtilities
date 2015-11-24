//
//  ExampleTableViewController.m
//  DRYUtilities
//
//  Created by Willem Van Pelt on 24/11/15.
//  Copyright © 2015 Michael Seghers. All rights reserved.
//

#import "ExampleTableViewController.h"

@interface ExampleTableViewController ()

@end

@implementation ExampleTableViewController {
    NSArray *_exampleItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"exampleItemCell"];

    [self _loadExampleItems];
}

- (void)_loadExampleItems {
    _exampleItems = @[
            @{@"label": @"Configuration utilities", @"segue" : @"goToDRYResourceReader"},
            @{@"label": @"CoreData: DRYCoreDataTableViewController", @"segue" : @"gotoDRYCoreDataTableViewController"},
            @{@"label": @"Foundation: NSNull DRYNSNullSupport", @"segue" : @"gotoDRYNSNullSupport"},
            @{@"label": @"Foundation: NSString DRYHex", @"segue" : @"gotoDRYHex"},
            @{@"label": @"Foundation: NSString DRYTemplateReplacement", @"segue" : @"gotoDRYTemplateReplacement"},
            @{@"label": @"Foundation: NSString DRYUtil", @"segue" : @"gotoDRYUtil"},
            @{@"label": @"Networking: DRYHTTPSessionManager", @"segue" : @"gotoDRYHTTPSessionManager"},
            @{@"label": @"Security: DRYSecurity", @"segue" : @"gotoDRYSecurity"},
            @{@"label": @"UIKit: UIView DRYLoadFromNib", @"segue" : @"goToDRYNib"}
    ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_exampleItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exampleItemCell" forIndexPath:indexPath];

    cell.textLabel.text = [_exampleItems[(NSUInteger) indexPath.row] objectForKey:@"label"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:[_exampleItems[(NSUInteger) indexPath.row] objectForKey:@"segue"] sender:self];
}


@end
