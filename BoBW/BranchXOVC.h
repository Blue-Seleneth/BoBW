//
//  BranchXOVC.h
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    typeX1,
    typeX2
} XType;

@interface BranchXOVC : UIViewController 
@property XType thisXType;
@end

