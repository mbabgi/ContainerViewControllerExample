//
//  SlideOutMenuContainerViewController.h
//  SlideOutMenuContainerViewControllerExample
//
//  Created by Sam Watts on 25/03/2013.
//  Copyright (c) 2013 Sam Watts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+SlideMenu.h"

@interface SlideOutMenuContainerViewController : UIViewController

- (id)initWithMenuViewController:(UIViewController *)menuViewController andCenterViewController:(UIViewController *)centerViewController;

- (void)presentMenuViewControllerAnimated:(BOOL)animated;
- (void)dismissMenuViewControllerAnimated:(BOOL)animated;

- (void)toggleMenuViewControllerAnimated:(BOOL)animated;

@end
