//
//  LunchViewController.m
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 3/23/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import "LunchViewController.h"
#import "NUIRenderer.h"

@interface LunchViewController ()

@end

@implementation LunchViewController

@synthesize navigationBar, menuBtn;

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
}

- (IBAction) revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void) viewDidAppear:(BOOL)animated
{
    // the styles are lost when the controllers transition, programmatically reset them
    [NUIRenderer renderNavigationBar:navigationBar withClass:@"TopBar"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
