//
//  AppDelegate.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/12.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "AppDelegate.h"
#import "HYKTabBarControllerTableViewController.h"
#import "HYKGuideController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (BOOL)isNewVersion {
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *oldVersion =  [userDefaults objectForKey:@"app_version"];
    
    if ([currentVersion isEqualToString:oldVersion]) {
        
        return NO;
        
    }else {
    
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:currentVersion forKey:@"app_version"];
        
        [userDefaults synchronize];
        
        return YES;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    if ([self isNewVersion]) {
        HYKGuideController *guide = [[HYKGuideController alloc]init];
        
        self.window.rootViewController = guide;
    }else {
    
    HYKTabBarControllerTableViewController *tabbarVc = [[HYKTabBarControllerTableViewController alloc]init];

    
    self.window.rootViewController = tabbarVc;
    }
    //设置状态栏白色需要去plist文件中修改
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    [self.window makeKeyAndVisible];
    
//    [self setNavBack];
    
    return YES;
}
//导航栏外观
//- (void)setNavBack {
//
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    //获取当前版本信息
//    if ([[UIDevice currentDevice].systemVersion doubleValue]>7.0) {
//        
//        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//        
//    }else {
//        
//        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"]forBarMetrics:UIBarMetricsDefault];
//    }
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    [navBar setTintColor:[UIColor whiteColor]];
//
//
//
//}

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
