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
 Called by the DRYCoreDataTableViewController when an update is detected for the given cell at the given indexpath. Your implementation of this method will typically use the fetched results controller to get the updated data. You should probably call this method from within the tableView:cellForRowAtIndexPath: method after dequeueing a cell.
 */
- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end