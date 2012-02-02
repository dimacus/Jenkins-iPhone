//
//  JenkinsJobView.h
//  Jenkins
//
//  Created by Dima Kovalenko on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JenkinsJobView : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *buildStatusLabel;
@property (nonatomic, retain) IBOutlet UILabel *buildHealthLabel;
@property (nonatomic, retain) IBOutlet UIImageView* statusImage;
@property (nonatomic, retain) IBOutlet UIImageView* healthImage;


@end
