//
//  DRYCoreDataTableViewController.h
//  Pods
//
//  Created by Michael Seghers on 10/02/15.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DRYCoreDataTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

/**
 Call this method when you want to avoid the fetched results controller to report updates of its content.
 
 You typically do this when you let the user edit the data in the table view. Since the changes are
 made by the user already, you don't need to receive updates from the fetched controller. 
 These updates could also give unwanted side effects in this scenario.
 */
@property (nonatomic) BOOL suspendAutomaticTrackingOfChangesInManagedObjectContext;

@end
