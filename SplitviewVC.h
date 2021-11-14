//
//  SplitviewVC.h
//  BoBW
//  Created by Timothy Conover on 9/3/21.
//

#import <UIKit/UIKit.h>
#import "PhoneOVC.h"

// this information is here for output view controllers to find it
@interface SplitviewVC : UISplitViewController
@property (nonatomic, strong) NSString *superString;
@property (nonatomic, strong) NSNumber *N;
@property (nonatomic, strong) NSNumber *X1;
@property (nonatomic, strong) NSNumber *X2;
@property (nonatomic, strong) NSArray <NSNumber *> *seriesArray;
@property (nonatomic) BOOL needRefresh;
//@property (nonatomic, strong) PhoneOVC *thePhoneOVC;
@end

