//
// Created by Joris Dubois on 09/03/16.
//

#import <Foundation/Foundation.h>


/**
 Protocol meant to extend the regular UITableViewDatasource when using a DRYCoreDataTableViewController. Whenever an update or a move for a cell in the table is detected, the DRYCoreDataTableViewController will check if the table view data source responds to configureCell:forIndexPath:
 You should always provide this method on your data source, otherwise updates wont be visible on your tableview!
 */
@protocol DRYCoreDataTableViewDataSource <NSObject>

/**
 Called by the DRYCoreDataTableViewController when an update is detected, represented by the given data for the given cell.
 */
- (void)configureCell:(UITableViewCell *)cell withData:(id)data;

@end