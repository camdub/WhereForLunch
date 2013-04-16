//
//  LunchViewController.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "LunchViewController.h"
#import <NUIRenderer.h>
#import <SVProgressHUD.h>
#import "VenueManager.h"

@interface LunchViewController ()

@end

@implementation LunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setup core location
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = 500.0f;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    if([CLLocationManager locationServicesEnabled])
        [_locationManager startUpdatingLocation];
    
}

#pragma mark Core Location Delagate and Venue load

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    
    // update current location
    NSDate *eventDate = location.timestamp;
    if (abs([eventDate timeIntervalSinceNow]) > 15.0) {
        [_locationManager stopUpdatingLocation];
        [[VenueManager sharedVenueManager] updateLocationWithLocation:location];
    }
    
    // Kick off RestKit request not on the main queue
    [SVProgressHUD show];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [[VenueManager sharedVenueManager] updateVenues];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadVenue) name:@"venuesLoaded" object:nil];
    });
}

- (void)loadVenue
{
    [SVProgressHUD dismiss];
    _currentVenue = [[[VenueManager sharedVenueManager] currentVenues] anyObject];
    _titleLabel.text = _currentVenue.name;
    _categoriesLabel.text = _currentVenue.formattedCategories;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Location Error: %@", error);
    //TODO better error handling (user interaction)
}

#pragma mark IB Methods

- (IBAction) revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

#pragma mark Lifecycle methods

- (void) viewDidAppear:(BOOL)animated
{
    // the styles are lost when the controllers transition, programmatically reset them
    [NUIRenderer renderNavigationBar:_navigationBar withClass:@"TopBar"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLabel:nil];
    [self setCategoriesLabel:nil];
    [super viewDidUnload];
}
@end
