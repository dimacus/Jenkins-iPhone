//
//  JenkinsViewHelper.m
//  Jenkins
//
//  Created by Dima Kovalenko on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JenkinsViewHelper.h"


@implementation JenkinsViewHelper


+ (void) getListOfJobsForView:(NSString*)jenkinsViewToFind{
    
    
    
}

+ (void) populateListOfJobsViewTable:(id)viewTable withJobsFromJenkinsView:(NSString*)jenkinsJobView{
    
    [viewTable addObject:@"foo"];
    NSLog(jenkinsJobView);
    
}



@end
