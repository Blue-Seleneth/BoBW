//
//  AppDelegate.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "AppDelegate.h"
#import "SplitviewVC.h"
#import "PadOVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   // Override point for customization after application launch.
   // demonstrate selecting which version of the detail VC to install
   SplitviewVC *svc = (SplitviewVC *)self.window.rootViewController;
   if ([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad) {   // iPad only, nothing to connect for iPhone
      UIViewController *masterVC= svc.viewControllers[0];
      PadOVC *padOVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PadOVC"];
      svc.viewControllers=@[masterVC,padOVC];
   }
      // demonstrate putting data into
   // the detail VC from AppDelegate
   NSString *duhstring=@"Beluga\nBob";
   svc.superString=duhstring;
   return YES;
}

@end
