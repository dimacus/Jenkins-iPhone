//
//  JenkinsListAllViews.h
//  Jenkins
//
//  Created by Dima Kovalenko on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JenkinsListAllViews : UITableViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>


@property (nonatomic, retain) IBOutlet UITableView* JenkinsListAllViewsTable;
@property (nonatomic, retain) NSMutableArray* JenkinsListAllViewsTableData;

@end
