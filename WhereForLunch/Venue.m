//  Venue.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/11/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "Venue.h"
#import "AutoCoding.h"

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

@end
