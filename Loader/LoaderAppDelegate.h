//
//  LoaderAppDelegate.h
//  Loader
//
//  Created by sonson on 11/03/01.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoaderViewController;

@interface LoaderAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet LoaderViewController *viewController;

@end
