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
    _venue = [[Venue alloc] init];
    _venue.categories = @[ @[@"Local Flavor", @"localflavor"], @[@"Mass Media", @"massmedia"] ];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFormattedCategories
{
    NSString *formattedCategories = [_venue formattedCategories];
    STAssertTrue([formattedCategories isEqualToString:@"Local Flavor, Mass Media"], @"categories formatted incorrectly");
    
}

@end
