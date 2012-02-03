//
//  JobHelper.m
//  Jenkins
//
//  Created by Dima Kovalenko on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JobHelper.h"
#import "JSONKit.h"
#import "DictionaryHelper.h"
#import "StringHelper.h"
#import "AFJSONRequestOperation.h"

@implementation JobHelper


+ (void) populateJenkinsJobView:(id)listOfLabels jobName:(NSString*)jobName{
        
    
    UILabel* status = [listOfLabels objectForKey:@"status"];
    UILabel* health = [listOfLabels objectForKey:@"health"];
    UIImageView* statusImage = [listOfLabels objectForKey:@"status_image"];
    UIImageView* healthImage = [listOfLabels objectForKey:@"health_image"];
    
        
//    NSString* url = [NSString stringWithFormat:@"http://ci.jenkins-ci.org/job/%@/api/json", jobName];
    NSString* url = @"http://buildmaster:8080/job/DimaSeleniumFF/api/json";    
    
    
    url = [url urlEncode];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        [healthImage setImage:[UIImage imageNamed:[JobHelper getHealthImage:JSON]]];
        
        statusImage.animationImages = [JobHelper getStatusImage:JSON];
        statusImage.animationDuration = 2;
        [statusImage startAnimating];
        
        status.text = [JobHelper getStatusLabel:JSON];
        health.text = [JobHelper getHealthLabel:JSON];;        
            
        
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


+ (NSString*) getHealthLabel:(id)jsonResponse{
    return [[[jsonResponse objectForKey:@"healthReport"] objectAtIndex:0] stringForKey:@"description"];
}

+ (NSString*) getHealthImage:(id)jsonResponse{
    return [[[jsonResponse objectForKey:@"healthReport"] objectAtIndex:0] stringForKey:@"iconUrl"];
}

+ (NSMutableArray*) getStatusImage:(id)jsonResponse{
    
    NSMutableArray* imageArray = [[NSMutableArray alloc] init];
    NSString* jobColor = [NSString stringWithFormat:@"%@.png", [jsonResponse stringForKey:@"color"]];
    
    if ([jobColor containsString:@"_anime"]) {
        [imageArray addObject:[UIImage imageNamed:jobColor]];
        [imageArray addObject:[UIImage imageNamed:@"blank.png"]]; 
    } else {
        [imageArray addObject:[UIImage imageNamed:jobColor]];
    }

    return imageArray;
    
    
    
}

+ (NSString*) getStatusLabel:(id)jsonResponse{
    
    
    
    if ([jsonResponse objectForKey:@"buildable"] == kCFBooleanFalse) {
     return @"Build is disabled";
    } else if ([[jsonResponse stringForKey:@"color"] containsString:@"_anime"]) {
        return @"Building";
    } else if ([jsonResponse objectForKey:@"inQueue"] == kCFBooleanFalse) {
     return @"Not building and nothing in queue";
    } else if ([jsonResponse objectForKey:@"inQueue"] == kCFBooleanTrue){
        return [[jsonResponse objectForKey:@"queueItem"] stringForKey:@"why"];
    }else {
     return @"Build in the queue";   
    }
    
}


@end
