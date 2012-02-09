//
//  JenkinsQueueHelper.m
//  Jenkins
//
//  Created by Dima Kovalenko on 2/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JenkinsQueueHelper.h"
#import "JSONKit.h"
#import "DictionaryHelper.h"
#import "StringHelper.h"
#import "AFJSONRequestOperation.h"


@implementation JenkinsQueueHelper


+ (void) populateBuildQueueTable:(id)queueTable with:(id)queueData forJobName:(id)jobName{
    
    NSString* url = [NSString stringWithFormat:@"http://buildmaster:8080/queue/api/json?tree=items[id,task[name,color],buildableStartMilliseconds]"];
    
    
    url = [url urlEncode];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        
        for (id queueElement in [JSON objectForKey:@"items"]) {
            NSMutableDictionary* buildDescription = [[NSMutableDictionary alloc] init];
            NSString* currentJob = [[queueElement objectForKey:@"task"] stringForKey:@"name"];
            
            if ([jobName isEqualToString:currentJob]) {
                NSString* name = [NSString stringWithFormat:@"%@", [queueElement objectForKey:@"id"]];
                
                [buildDescription setObject:name forKey:@"name"];
                [buildDescription setObject:[UIImage imageNamed:@"clock.png"] forKey:@"image"];                
                
                [queueData addObject:buildDescription];
            }
        }
        
        [queueTable reloadData];
        
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
