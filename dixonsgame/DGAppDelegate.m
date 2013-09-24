//
//  DGAppDelegate.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGAppDelegate.h"


@implementation DGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
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
	[self triggerCheckForAppUpdate];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)triggerCheckForAppUpdate {
    NSLog(@"triggerCheckForAppUpdate");
	
	/* Operation Queue init (autorelease) */
    NSOperationQueue *queue = [NSOperationQueue new];
    /* Create our NSInvocationOperation to call loadDataWithOperation, passing in nil */
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
																			selector:@selector(checkForAppUpdate)
																			  object:nil];
	
    /* Add the operation to the queue */
    [queue addOperation:operation];
	
	
}

- (void)checkForAppUpdate {
    NSLog(@"checkForAppUpdate");
	BOOL updateAvailable = NO;
    NSDictionary *updateDictionary = [NSDictionary dictionaryWithContentsOfURL:
                                      [NSURL URLWithString:@"https://www.basgroup.nu/wp-content/uploads/dixonsgame.plist"]];
    
    if(updateDictionary)
    {
        NSArray *items = [updateDictionary objectForKey:@"items"];
        NSDictionary *itemDict = [items lastObject];
        
        NSDictionary *metaData = [itemDict objectForKey:@"metadata"];
        NSString *newversion = [metaData valueForKey:@"bundle-version"];
        NSString *currentversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        
        updateAvailable = ([newversion compare:currentversion options:NSNumericSearch] == NSOrderedDescending);
    }
	
	NSLog(@"appUpdateAvailable: %@", updateAvailable ? @"YES" : @"NO");
	if (updateAvailable) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App update beschikbaar" message:@"Wil je de nieuwe app nu installeren?" delegate:self cancelButtonTitle:@"Annuleer" otherButtonTitles:@"OK", nil];
		[alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
		//[alert show];
	}
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%i",buttonIndex);
    if (buttonIndex == 1 ) {
        

        
        NSURL *appURL = [NSURL URLWithString: [@"itms-services://?action=download-manifest&url=https://www.basgroup.nu/wp-content/uploads/dixonsgame.plist" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL:appURL]) {
            [[UIApplication sharedApplication] openURL:appURL];
        } else {
            NSLog(@"cannot open?");
        }
    }
    
}



@end
