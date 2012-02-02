//
//  JenkinsJobView.m
//  Jenkins
//
//  Created by Dima Kovalenko on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JenkinsJobView.h"
#import "JobHelper.h"

@implementation JenkinsJobView

@synthesize titleLabel;
@synthesize buildHealthLabel;
@synthesize buildStatusLabel;
@synthesize statusImage;
@synthesize healthImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [statusImage dealloc];
    [healthImage dealloc];
    [titleLabel dealloc];
    [buildStatusLabel dealloc];
    [buildStatusLabel dealloc];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleLabel.text = self.title;

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    NSMutableDictionary* listOfItemsOnScreen = [[NSMutableDictionary alloc] init];
    
    [listOfItemsOnScreen setObject:buildStatusLabel forKey:@"status"];
    [listOfItemsOnScreen setObject:buildHealthLabel forKey:@"health"];
    
    [JobHelper populateJenkinsJobView:listOfItemsOnScreen jobName:self.title];
     
    listOfItemsOnScreen = nil;

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
