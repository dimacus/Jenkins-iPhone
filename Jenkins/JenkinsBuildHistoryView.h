//
//  JenkinsBuildHistoryView.h
//  Jenkins
//
//  Created by Dima Kovalenko on 2/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JenkinsBuildHistoryView : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) IBOutlet UITableView* JenkinsBuildHistoryTable;
@property (nonatomic, retain) NSMutableArray* InQueueData;
@property (nonatomic, retain) NSMutableArray* BuildingData;
@property (nonatomic, retain) NSMutableArray* FinishedData;

@end
