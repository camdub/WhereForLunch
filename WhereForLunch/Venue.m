//  Venue.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/11/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "Venue.h"
#import "AutoCoding.h"
#import <Underscore.h>

#define _ Underscore

@implementation Venue

- (CLLocationCoordinate2D)coordinate
{
    CLLocationDegrees lat = [_latitude doubleValue];
    CLLocationDegrees lon = [_longitude doubleValue];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    if(CLLocationCoordinate2DIsValid(coord) == NO)
        NSLog(@"Invalid Coordinate: lat=%lf lon=%lf", lat, lon);
    return coord;
}

/* yelp's readable category is first (0th) element in the categories array
 * i.e.
 * [ "Local Flavor", "localflavor" ], [ "Mass Media", "massmedia" ] ]
 */
- (NSString *)formattedCategories
{
    NSArray *readableCats = _.array(_categories)
        .map(^NSString *(NSArray *category) {
            return category[0]; 
        }).unwrap;
    return [readableCats componentsJoinedByString:@", "];
}

@end
