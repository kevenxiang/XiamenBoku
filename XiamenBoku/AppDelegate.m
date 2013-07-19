//
//  AppDelegate.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-10.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"


#import <BaiduSocialShare/BDSocialShareSDK.h>



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    self.window.rootViewController =self.viewController;
    [self.window makeKeyAndVisible];
    
    //设置百度分享SDK
    NSArray *platForms=[NSArray arrayWithObjects:kBD_SOCIAL_SHARE_PLATFORM_SINAWEIBO,kBD_SOCIAL_SHARE_PLATFORM_QQWEIBO,kBD_SOCIAL_SHARE_PLATFORM_QQZONE,kBD_SOCIAL_SHARE_PLATFORM_KAIXIN,kBD_SOCIAL_SHARE_PLATFORM_WEIXIN_SESSION,kBD_SOCIAL_SHARE_PLATFORM_WEIXIN_TIMELINE,
                        kBD_SOCIAL_SHARE_PLATFORM_EMAIL,
                        kBD_SOCIAL_SHARE_PLATFORM_SMS,nil];
    [BDSocialShareSDK registerApiKey:@"dHwDe5TTTtFEv4MOgoeTGLvX" andSupportPlatforms:platForms];
    [BDSocialShareSDK registerWXApp:@"wx712df8473f2a1dbe"];
    [BDSocialShareSDK enableSinaWeiboSSOWithAppId:@"319137445"];
    [BDSocialShareSDK enableQQSSOWithAppId:@"100358052"];
    
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
