//
//  main.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings initWithStylesheet:@"Lunch"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
