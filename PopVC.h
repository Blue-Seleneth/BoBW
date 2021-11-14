//
//  PopVC.h
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import <UIKit/UIKit.h>

@class Table2VC;

@interface PopVC : UIViewController <UITextFieldDelegate>
@property Table2VC *theTable2VC;
@property (weak, nonatomic) UITextField *theTextField;
@property (weak, nonatomic) UIButton *selectButton;
- (void) selectPressed:(UIButton *) sender;
@end

