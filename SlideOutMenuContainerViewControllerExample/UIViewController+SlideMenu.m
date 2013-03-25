//
//  UIViewController+SlideMenu.m
//  SlideOutMenuContainerViewControllerExample
//
//  Created by Sam Watts on 25/03/2013.
//  Copyright (c) 2013 Sam Watts. All rights reserved.
//

#import "UIViewController+SlideMenu.h"
#import "SlideOutMenuContainerViewController.h"

@implementation UIViewController (SlideMenu)

- (SlideOutMenuContainerViewController *)containerViewController
{
    UIViewController *parent = self.parentViewController;
    while (parent)
    {
        if ([parent isKindOfClass:[SlideOutMenuContainerViewController class]])
        {
            return (SlideOutMenuContainerViewController *)parent;
        }
        else if (parent.parentViewController && parent.parentViewController != parent)
        {
            parent = parent.parentViewController;
        }
        else
        {
            parent = nil;
        }
    }
    
    return nil;
}


@end
