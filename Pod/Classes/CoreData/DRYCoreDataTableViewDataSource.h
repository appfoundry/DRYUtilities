//
// Created by Joris Dubois on 09/03/16.
//

#import <Foundation/Foundation.h>

@protocol DRYCoreDataTableViewDataSource <NSObject>

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end