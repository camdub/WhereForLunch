//
//  WhereForLunchTests.m
//  WhereForLunchTests
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "WhereForLunchTests.h"
#import <RestKit/RestKit.h>
#import <RestKit/Testing.h>
#import "MappingProvider.h"
#import "Venue.h"

@implementation WhereForLunchTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSBundle *testBundle = [NSBundle bundleWithIdentifier:@"com.cwoodmansee.WhereForLunchTests"];
    [RKTestFixture setFixtureBundle:testBundle];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    id json = [RKTestFixture parsedObjectWithContentsOfFixture:@"venues.json"];
    RKMappingTest *test = [RKMappingTest testWith]
}

@end
