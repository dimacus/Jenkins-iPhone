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
@synthesize tabBar;

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
    [statusImage release];
    [healthImage release];
    [titleLabel release];
    [buildStatusLabel release];
    [buildHealthLabel release];
    [tabBar release];
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
    self.tabBar.selectedItem = [tabBar.items objectAtIndex:0];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    NSMutableDictionary* listOfItemsOnScreen = [[NSMutableDictionary alloc] init];
    
    [listOfItemsOnScreen setObject:buildStatusLabel forKey:@"status"];
    [listOfItemsOnScreen setObject:buildHealthLabel forKey:@"health"];
    [listOfItemsOnScreen setObject:statusImage forKey:@"status_image"];
    [listOfItemsOnScreen setObject:healthImage forKey:@"health_image"];
    
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

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    
    
     
   NSLog(@"Tab clicked: %d", item.tag);
}

@end
