//
//  PopVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "PopVC.h"
#import "Table2VC.h"

@interface PopVC ()

@end

@implementation PopVC {
    BOOL isPad;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
    isPad=([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return [self textFieldShouldReturn:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL isGood=NO;
    char nptr[80], *endptr;
    long longN;
    [textField.text getCString:nptr
                     maxLength:79
                      encoding:NSASCIIStringEncoding];
    longN=strtol(nptr, &endptr, 10);
    if (endptr==nptr)   // strtod conversion failure
        isGood=NO;
    else {
        if (longN>0)
           isGood=YES;
    }
    if (isGood)
        [textField resignFirstResponder];
    return isGood;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.intValue==7)
        self.theTextField.text=[NSString stringWithFormat:@"%@",self.navigationController ];
      // nothing to do, just leave number as text
}

- (void) selectPressed:(UIButton *) sender {
    [self.theTable2VC receiveN:self.theTextField.text.intValue];
    if (self.navigationController==NULL)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
}

@end
