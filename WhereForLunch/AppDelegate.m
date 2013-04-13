//
//  AppDelegate.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import "MappingProvider.h"
#import "Venue.h"
#import <GCOAuth.h>

#define CONSUMER_KEY @"0ALRLtLH-iF4R07jOXLupQ"
#define CONSUMER_SECRET @"AMzJgOLZotHaq02YUyfUX3J0dPk"
#define TOKEN @"bqfyQdTxPHwU5-VjwJLvQiqMu5-so0MF"
#define TOKENSECRET @"kYOtKQU3krIFSjY8mNIkKlHV0_s"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [NUISettings initWithStylesheet:@"Lunch"];
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKMapping *mapping = [MappingProvider venueMapping];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:@"/v2/search" keyPath:@"businesses" statusCodes:statusCodes];
    
    NSURLRequest *request = [GCOAuth URLRequestForPath:@"api.yelp.com/v2/search" GETParameters:@{ @"term" : @"food", @"location" : @"San Francisco" } host:@"" consumerKey:CONSUMER_KEY consumerSecret:CONSUMER_SECRET accessToken:TOKEN tokenSecret:TOKENSECRET];
    
    RKObjectRequestOperation *rkoperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    
    [rkoperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSArray *venues = mappingResult.array;
        NSLog(@"%d", [venues count]);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Error");
    }];
    
    [rkoperation start];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
