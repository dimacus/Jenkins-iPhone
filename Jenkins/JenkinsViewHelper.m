//
//  JenkinsViewHelper.m
//  Jenkins
//
//  Created by Dima Kovalenko on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JenkinsViewHelper.h"
#import "JSONKit.h"
#import "DictionaryHelper.h"
#import "StringHelper.h"
#import "AFJSONRequestOperation.h"

@implementation JenkinsViewHelper


+ (void) getListOfJobsForView:(NSString*)jenkinsViewToFind{
    
    
    
}

+ (void) populateListOfJobsViewTable:(id)viewTable withData:(id)viewTableData withJobsFromJenkinsView:(NSString*)jenkinsJobView{
    
    NSString* url = [NSString stringWithFormat:@"http://ci.jenkins-ci.org/view/%@/api/json", jenkinsJobView];
    
        
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        for (id jobElement in [JSON objectForKey:@"jobs"]) {
            [viewTableData addObject:jobElement];
        }
        
        [viewTable reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retriving Jobs for view" 
                                                        message:[error localizedDescription] 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }];
    [operation start];
    
}



@end
