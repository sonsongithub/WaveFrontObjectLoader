//
//  LoaderViewController.m
//  Loader
//
//  Created by sonson on 11/03/01.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoaderViewController.h"

#import "MyGLView.h"

@implementation LoaderViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	MyGLView *glview = [[MyGLView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:glview];
	[glview release];
	[glview startAnimation];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
