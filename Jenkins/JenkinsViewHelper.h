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

+ (void) getListOfJobsForView:(NSString*)jenkinsViewToFind;

+ (void) populateListOfJobsViewTable:(id)viewTable withJobsFromJenkinsView:(NSString*)jenkinsJobView;

@end
