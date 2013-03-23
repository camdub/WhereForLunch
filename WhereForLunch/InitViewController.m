//
//  InitViewController.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "InitViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.topViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"Lunch"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
