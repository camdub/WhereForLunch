//
//  Venue.h
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/11/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface Venue : NSObject

@property (nonatomic, assign) NSInteger yelpId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longitude;
@property (nonatomic, copy) NSString *ratingImgURL;
@property (nonatomic, strong) NSArray *categories;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
