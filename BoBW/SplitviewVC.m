//
//  SplitviewVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "SplitviewVC.h"

@interface SplitviewVC ()

@end

@implementation SplitviewVC : UISplitViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
   self.maximumPrimaryColumnWidth = 270;
   BOOL isPad=([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad);
   if (isPad){
      BOOL isportrait=(UIApplication.sharedApplication.statusBarOrientation==UIInterfaceOrientationPortrait);
      if (isportrait) 
         self.preferredDisplayMode=UISplitViewControllerDisplayModeOneOverSecondary;
      else
         self.preferredDisplayMode=UISplitViewControllerDisplayModeOneBesideSecondary;
   }
//    else
//        self.thePhoneOVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PhoneOVC"];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
   BOOL isPad=([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad);
   if (isPad){
      if (size.height>size.width)  // portrait
         self.preferredDisplayMode=UISplitViewControllerDisplayModeOneOverSecondary;
      else     // landscape
         self.preferredDisplayMode=UISplitViewControllerDisplayModeOneBesideSecondary;
   }
}

@end
