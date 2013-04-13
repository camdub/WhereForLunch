//
//  MappingProvider.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/12/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "MappingProvider.h"
#import "Venue.h"

@implementation MappingProvider

+ (RKMapping *)venueMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Venue class]];
    
    [mapping addAttributeMappingsFromArray:@[@"name", @"categories"]];
    [mapping addAttributeMappingsFromDictionary:@{
        @"id": @"yelpId",
        @"location.display_address" : @"address",
        @"location.coordinate.latitude" : @"latitude",
        @"location.coordinate.longitude" : @"longitude"
    }];
    return mapping;
}

@end
