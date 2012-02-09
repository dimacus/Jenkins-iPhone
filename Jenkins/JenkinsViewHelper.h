//
//  JenkinsViewHelper.h
//  Jenkins
//
//  Created by Dima Kovalenko on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JenkinsViewHelper : NSObject {
    
}


+ (void) populateListOfJobsViewTable:(id)viewTable withData:(id)viewTableData withJobsFromJenkinsView:(NSString*)jenkinsJobView;

+ (void) populateListOfAllViewsTable:(id)viewTable withData:(id)viewTableData;

+ (void) populateBuildQueueTableWithRunningAndFinishedJobs:(id)viewTable withData:(id)buildData forJobName:(id)jobName;

@end
