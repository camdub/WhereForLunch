//
//  VenueManager.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/13/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "VenueManager.h"

#define _ Underscore

@implementation VenueManager

+(id)sharedVenueManager
{
    static VenueManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

-(id)init
{
    self = [super init];
    if (self) {
        _defaultsFilePath = [[NSBundle mainBundle] pathForResource:@"searchDefaults" ofType:@"plist"];
    }
    return self;
}

-(void)updateLocationWithLocation:(CLLocation *)newLocation
{
    _location = newLocation;
}

- (NSDictionary *)GETParams
{
    NSString *locationString = [[NSString alloc] initWithFormat:@"%f,%f",
                                _location.coordinate.latitude, _location.coordinate.longitude];
    NSDictionary *bundle = [[NSDictionary alloc] initWithContentsOfFile:_defaultsFilePath];
    return _.defaults(bundle, @{ @"ll" : locationString });
}


-(void)updateVenues
{
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKMapping *mapping = [MappingProvider venueMapping];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                       pathPattern:@"/v2/search"
                                                                                           keyPath:@"businesses"
                                                                                       statusCodes:statusCodes];
    
    NSURLRequest *request = [GCOAuth URLRequestForPath:@"api.yelp.com/v2/search"
                                         GETParameters:[self GETParams]
                                                  host:@""
                                           consumerKey:CONSUMER_KEY
                                        consumerSecret:CONSUMER_SECRET
                                           accessToken:TOKEN
                                           tokenSecret:TOKENSECRET];
    
    RKObjectRequestOperation *rkoperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    
    [rkoperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (_currentVenues == nil) {
            _currentVenues = [[NSSet alloc] initWithArray:mappingResult.array];
        } else {
            _currentVenues = [_currentVenues setByAddingObjectsFromArray:mappingResult.array];
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
    
    [rkoperation start];
}

@end
