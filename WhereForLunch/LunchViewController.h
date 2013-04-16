//
//  LunchViewController.h
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TopViewController.h"
#import "Venue.h"

@interface LunchViewController : TopViewController <CLLocationManagerDelegate>

// Core Location
// the VenueManager keeps track of the current location
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Venue *currentVenue;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void)loadVenue;

// UI
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) UIBarButtonItem *menuBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoriesLabel;

@end
