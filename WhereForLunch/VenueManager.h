//
//  VenueManager.h
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/13/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <Underscore.h>
#import <RestKit/RestKit.h>
#import <GCOAuth.h>
#import "MappingProvider.h"

#define CONSUMER_KEY @"0ALRLtLH-iF4R07jOXLupQ"
#define CONSUMER_SECRET @"AMzJgOLZotHaq02YUyfUX3J0dPk"
#define TOKEN @"bqfyQdTxPHwU5-VjwJLvQiqMu5-so0MF"
#define TOKENSECRET @"kYOtKQU3krIFSjY8mNIkKlHV0_s"

@interface VenueManager : NSObject

@property (nonatomic, strong) NSSet *history;
@property (nonatomic, strong) NSSet *favorites;
@property (nonatomic, strong) __block NSSet *currentVenues;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *defaultsFilePath;

+ (id)sharedVenueManager; // Singleton
- (void)updateVenues;
- (void)updateLocationWithLocation:(CLLocation *)location;
- (NSDictionary *)GETParams;

@end
