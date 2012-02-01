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
    
        
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://buildmaster:8080/view/Any%20Branch/api/json"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        for (id jobElement in [JSON objectForKey:@"jobs"]) {
            [viewTableData addObject:[jobElement objectForKey:@"name"]];
        }
        
        
        [viewTable reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog([error localizedDescription]);
        //        label.text = @"error";
//        [SVProgressHUD dismissWithError:[error localizedDescription]];
    }];
    [operation start];
    
}



@end
