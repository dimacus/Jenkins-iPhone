//
//  JenkinsQueueHelper.h
//  Jenkins
//
//  Created by Dima Kovalenko on 2/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JenkinsQueueHelper : NSObject {
    
}

+ (void) populateBuildQueueTable:(id)queueTable with:(id)queueData forJobName:(id)jobName;

@end
