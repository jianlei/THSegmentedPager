//
//  AppDelegate.m
//  THSegmentedPagerExample
//
//  Created by Hannes Tribus on 25/07/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import "AppDelegate.h"
#import "THSegmentedPager.h"
#import "SamplePagedViewController.h"

//#define LOAD_WITH_IDENTIFIERS = 0;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    THSegmentedPager *pager = (THSegmentedPager *)((UINavigationController *)self.window.rootViewController).topViewController;
#ifndef LOAD_WITH_IDENTIFIERS
    NSMutableArray *pages = [NSMutableArray new];
    for (int i = 1; i < 4; i++) {
        // Create a new view controller and pass suitable data.
        SamplePagedViewController *pagedViewController = [pager.storyboard instantiateViewControllerWithIdentifier:@"SamplePagedViewController"];
        [pagedViewController setViewTitle:[NSString stringWithFormat:@"Page %d",i]];
        [pagedViewController.view setBackgroundColor:[UIColor colorWithHue:((i/8)%20)/20.0+0.02 saturation:(i%8+3)/10.0 brightness:91/100.0 alpha:1]];
        [pages addObject:pagedViewController];
    }
    [pager setPages:pages];
#else
    [pager setupPagesFromStoryboardWithIdentifiers:@[@"SamplePagedViewController",@"SamplePagedViewController",@"SamplePagedViewController"]];
#endif
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
