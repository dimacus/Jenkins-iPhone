//
//  JenkinsJobsForView.h
//  Jenkins
//
//  Created by Dima Kovalenko on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface JenkinsJobsForView : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) IBOutlet UITableView* JenkinsJobsForViewTable;
@property (nonatomic, retain) NSMutableArray* JenkinsJobsForViewTableData;

@end
