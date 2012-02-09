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
#import "JobHelper.h"

@implementation JenkinsViewHelper



+ (void) populateListOfJobsViewTable:(id)viewTable withData:(id)viewTableData withJobsFromJenkinsView:(NSString*)jenkinsJobView{
    
    NSString* url = [NSString stringWithFormat:@"http://ci.jenkins-ci.org/view/%@/api/json", jenkinsJobView];
    
    
    url = [url urlEncode];
        
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


+ (void) populateListOfAllViewsTable:(id)viewTable withData:(id)viewTableData{

    NSString* url = @"http://ci.jenkins-ci.org/api/json?tree=views[name]";
    
    url = [url urlEncode];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        
        
        for (id jenkinsView in [JSON objectForKey:@"views"]) {
            [viewTableData addObject:[jenkinsView stringForKey:@"name"]];
        }
        
        [viewTable reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retriving Views" 
                                                        message:[error localizedDescription] 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }];
    [operation start];
    
    
}

+ (void) populateBuildQueueTableWithRunningAndFinishedJobs:(id)viewTable withData:(id)buildData forJobName:(id)jobName{
    
    
    NSString* url = [NSString stringWithFormat:@"http://ci.jenkins-ci.org/view/%@/api/json?tree=builds[result,timestamp,duration,building,number,fullDisplayName,color]", jobName];
    
    
    url = [url urlEncode];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        
        
        for (id buildElement in [JSON objectForKey:@"builds"]) {
            
            
            if ([buildElement objectForKey:@"building"] == kCFBooleanTrue) {
                
                [[buildData objectAtIndex:0] setObject:@"name" forKey:@"name"];
                
            } else {
                
                
                [[buildData objectAtIndex:1] setObject:@"name" forKey:@"name"];
            }
                
            
            
            
            
//            statusImage.animationImages = [JobHelper getStatusImage:JSON];
//            statusImage.animationDuration = 2;
//            [statusImage startAnimating];

        }
        
        [viewTable reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retriving Views" 
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
