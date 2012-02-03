//
//  JobHelper.h
//  Jenkins
//
//  Created by Dima Kovalenko on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JobHelper : NSObject {
    
}


+ (void) populateJenkinsJobView:(id)listOfLabels jobName:(NSString*)jobName;

+ (NSString*) getHealthLabel:(id)jsonResponse;
+ (NSString*) getHealthImage:(id)jsonResponse;
+ (NSMutableArray*) getStatusImage:(id)jsonResponse;
+ (NSString*) getStatusLabel:(id)jsonResponse;
@end
