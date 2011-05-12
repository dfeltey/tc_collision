//
//  AppDelegate.h
//  TCCollision
//
//  Created by Daniel Feltey on 5/12/11.
//  Copyright University of Chicago 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
