//
//  JenkinsJobsForView.h
//  Jenkins
//
//  Created by Dima Kovalenko on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JenkinsJobsForView : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, retain) IBOutlet UITableView* JenkinsJobsForViewTable;
@property (nonatomic, retain) NSMutableArray* JenkinsJobsForViewTableData;

@end
