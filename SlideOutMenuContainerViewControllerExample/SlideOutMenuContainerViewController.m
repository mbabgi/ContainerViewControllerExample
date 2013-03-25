//
//  SlideOutMenuContainerViewController.m
//  SlideOutMenuContainerViewControllerExample
//
//  Created by Sam Watts on 25/03/2013.
//  Copyright (c) 2013 Sam Watts. All rights reserved.
//

#import "SlideOutMenuContainerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SlideOutMenuContainerViewController () {
    BOOL _menuVisible;
}

@property (nonatomic, strong) UIViewController *menuViewController;
@property (nonatomic, strong) UIViewController *centerViewController;

@end

@implementation SlideOutMenuContainerViewController

- (id)initWithMenuViewController:(UIViewController *)menuViewController andCenterViewController:(UIViewController *)centerViewController
{
    self = [super init];
    if (self)
    {
        _menuViewController = menuViewController;
        _centerViewController = centerViewController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor blackColor];
    
    self.centerViewController.view.frame = self.view.bounds;
    
    [self addChildViewController:self.centerViewController];
    [self.centerViewController willMoveToParentViewController:self];
    [self.view addSubview:self.centerViewController.view];
    [self.centerViewController didMoveToParentViewController:self];
    
    self.centerViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.centerViewController.view.layer.shadowOffset = CGSizeMake(-2.0f, 0.0f);
    self.centerViewController.view.layer.shadowRadius = 2.0f;
    self.centerViewController.view.layer.shadowOpacity = 0.8f;
    self.centerViewController.view.clipsToBounds = NO;
}

- (void)presentMenuViewControllerAnimated:(BOOL)animated
{
    self.menuViewController.view.frame = self.view.bounds;
    self.menuViewController.view.transform = CGAffineTransformMakeScale(0.95f, 0.95f);
    self.menuViewController.view.alpha = 0.8f;
    
    [self addChildViewController:self.menuViewController];
    [self.menuViewController willMoveToParentViewController:self];
    [self.view addSubview:self.menuViewController.view];
    [self.view sendSubviewToBack:self.menuViewController.view];
    [self.menuViewController didMoveToParentViewController:self];
    
    [UIView animateWithDuration:animated ? 0.25f : 0.0f animations:^{
        
        self.centerViewController.view.frame = CGRectOffset(self.view.bounds, self.view.bounds.size.width * 0.9f, 0.0f);
        self.menuViewController.view.transform = CGAffineTransformIdentity;
        self.menuViewController.view.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        _menuVisible = YES;
    }];
}

- (void)toggleMenuViewControllerAnimated:(BOOL)animated
{
    if (_menuVisible)
        [self dismissMenuViewControllerAnimated:animated];
    else
        [self presentMenuViewControllerAnimated:animated];
}

- (void)dismissMenuViewControllerAnimated:(BOOL)animated
{
    [UIView animateWithDuration:animated ? 0.25f : 0.0f animations:^{
        
        self.centerViewController.view.frame = CGRectOffset(self.view.bounds, -20.0f, 0.0f);
        self.menuViewController.view.transform = CGAffineTransformMakeScale(0.95f, 0.95f);
        self.menuViewController.view.alpha = 0.8f;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1f animations:^{
            self.centerViewController.view.frame = CGRectOffset(self.view.bounds, 5.0f, 0.0f);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.05f animations:^{
                self.centerViewController.view.frame = self.view.bounds;
            }completion:^(BOOL finished) {
                [self.menuViewController removeFromParentViewController];
                [self.menuViewController willMoveToParentViewController:nil];
                [self.menuViewController.view removeFromSuperview];
                [self.menuViewController didMoveToParentViewController:nil];
                
                self.menuViewController.view.transform = CGAffineTransformIdentity;
                
                _menuVisible = NO;
            }];
        }];
    }];
}














@end
