//
//  RKMappingTest.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/12/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <RestKit/Testing.h>
#import "MappingProvider.h"
#import "Venue.h"

@implementation RKMappingTest

- (void)setup
{
    NSBundle *testBundle = [NSBundle bundleWithIdentifier:@"com.cwoodmansee."];
    [RKTestFixture setFixtureBundle:testBundle];
}

- (void)testVenueMapping
{
}

@end
