//
//  AppDelegate.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "AppDelegate.h"
#import "CLHomeViewController.h"
#import "CLPersonViewController.h"
#import "CLSettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    CLHomeViewController *homeVC = [[CLHomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    CLPersonViewController *personVC = [[CLPersonViewController alloc] init];
    UINavigationController *personNav = [[UINavigationController alloc] initWithRootViewController:personVC];

    CLSettingViewController *settingVC = [[CLSettingViewController alloc] init];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:settingVC];

    self.IIVDC = [SKSlideViewController getSlideViewControllerWithMainController:(id)homeNav leftController:(id)settingNav rightController:(id)personNav];
    self.IIVDC.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.IIVDC;
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios6"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    [barAttrs setObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    [barAttrs setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:UITextAttributeTextShadowOffset];
    [[UINavigationBar appearance] setTitleTextAttributes:barAttrs];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)setSKSlideViewControllerReference:(SKSlideViewController *)aSlideViewController{

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
