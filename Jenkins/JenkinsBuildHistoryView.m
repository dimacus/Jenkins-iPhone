//
//  JenkinsBuildHistoryView.m
//  Jenkins
//
//  Created by Dima Kovalenko on 2/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JenkinsBuildHistoryView.h"
#import "JenkinsQueueHelper.h"
#import "JobHelper.h"
#import "JenkinsViewHelper.h"

@implementation JenkinsBuildHistoryView

@synthesize JenkinsBuildHistoryTable;
@synthesize InQueueData;
@synthesize BuildingData;
@synthesize FinishedData;



- (void)dealloc
{
    [JenkinsBuildHistoryTable release];
    [BuildingData release];
    [FinishedData release];
    [InQueueData release];
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
    self.title = @"DimaSeleniumFF";
    
    NSMutableDictionary* loadingMessage = [[NSMutableDictionary alloc] init];

    [loadingMessage setObject:@"Loading..." forKey:@"name"];
    
    InQueueData  = [[NSMutableArray alloc] initWithObjects:loadingMessage, nil];
    BuildingData = [[NSMutableArray alloc] initWithObjects:loadingMessage, nil];
    FinishedData = [[NSMutableArray alloc] initWithObjects:loadingMessage, nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    InQueueData  = [[NSMutableArray alloc] init];
    BuildingData = [[NSMutableArray alloc] init];
    FinishedData = [[NSMutableArray alloc] init];
    
    NSArray* buildTypes = [[NSArray alloc] initWithObjects:BuildingData, FinishedData, nil];
    
    [JenkinsQueueHelper populateBuildQueueTable:JenkinsBuildHistoryTable with:InQueueData forJobName:self.title];
    
    [JenkinsViewHelper populateBuildQueueTableWithRunningAndFinishedJobs:JenkinsBuildHistoryTable withData:buildTypes forJobName:self.title];
    

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [InQueueData count];
            break;
        case 1:
            return [BuildingData count];
        case 2:
            return [FinishedData count];
        default:
            return 1; //Just in case, but this should never be
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"In Queue";
            break;
            
        case 1:
            return @"Building";
            break;
            
        case 2:
            return @"Finished";
            break;
        default:
            break;
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[InQueueData objectAtIndex:indexPath.row] stringForKey:@"name"];
            cell.imageView.image = [[InQueueData objectAtIndex:indexPath.row] objectForKey:@"image"];
            break;
        case 1:
            cell.textLabel.text = [[BuildingData objectAtIndex:indexPath.row] stringForKey:@"name"];
            break;
        case 2:
            cell.textLabel.text = [[FinishedData objectAtIndex:indexPath.row] stringForKey:@"name"];
            break;            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
