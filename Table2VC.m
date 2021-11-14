//
//  Table2VC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "Table2VC.h"
#import "SplitviewVC.h"
#import "PadOVC.h"
#import "PhoneOVC.h"
#import "PopVC.h"
#include "math.h"

@interface Table2VC ()
- (IBAction)runButtonPressed:(UIButton *)sender;
- (IBAction)Nbutton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation Table2VC {
   int N;
    BOOL isPad;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
   N=1;
    isPad=([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad);
}

- (void)receiveN:(int)Na {
    // receive N from popover
    N=Na;
    self.myTextField.text=[NSString stringWithFormat:@"%d",N];
}

// this is an invisible button that covers up the text field!
- (IBAction)Nbutton:(UIButton *)sender {
    // Create popup view for N entry
    PopVC *PVC = [[PopVC alloc] init];
    PVC.view.backgroundColor=[UIColor colorWithRed:0.92 green:1.0 blue:1.0 alpha:1.0];
    PVC.theTable2VC=self;
    if (isPad) {
        PVC.preferredContentSize=CGSizeMake(250.0, 250.0);
        PVC.modalPresentationStyle=UIModalPresentationPopover;
        [self presentViewController:PVC animated:YES completion:nil];
        UIPopoverPresentationController *PPC=PVC.popoverPresentationController;
        PPC.permittedArrowDirections=UIPopoverArrowDirectionLeft;
        PPC.sourceView=sender;
        PPC.sourceRect=sender.bounds;
    }
    
    UITextField *textField=[[UITextField alloc] init];
    textField.frame=CGRectMake(60.0, 72.0, 150.0, 30.0);
    textField.delegate=PVC;
    UIFont *fontt=[UIFont systemFontOfSize:17];
    textField.font=fontt;
    textField.textAlignment=NSTextAlignmentCenter;
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.autocorrectionType=UITextAutocorrectionTypeNo;
    textField.autocapitalizationType=UITextAutocapitalizationTypeNone;
    textField.spellCheckingType=UITextSpellCheckingTypeNo;
    textField.text=[NSString stringWithFormat:@"%d",N];
    [PVC.view addSubview:textField];
    PVC.theTextField=textField;
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UIFont *font=[UIFont systemFontOfSize:17];
    NSDictionary *dict = @{NSFontAttributeName:font};
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Select" attributes:dict];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    button.frame=CGRectMake(50.0, 190.0, 150.0, 40.0);
    [button addTarget:PVC action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [PVC.view addSubview:button];
    //  default iOS can present popover in a compact environment
    // as a modal view BUT I like it better to do this manually using nav
    // controller so have the back button to dismiss
    if (!isPad)
        [self.navigationController pushViewController:PVC animated:YES];  
}

- (IBAction)runButtonPressed:(UIButton *)sender {
   double X1, X2;
   int X=N;
   NSMutableArray <NSNumber *> *anArray = [NSMutableArray arrayWithCapacity:1];
   
   X1=(1.0+sqrt(1.0+4.0*N))/2.0;    // solve x^2 - x = N
   X2=(N+sqrt(N*N+4.0))/2.0;          // solve 1/x - x = N
   anArray[0]=[NSNumber numberWithInt:X];    // build Collatz sequence for N
   while (X>1) {
      if (X%2>0)  // if odd
         X=3*X+1;
      else
         X=X/2;
      [anArray addObject:[NSNumber numberWithInt:X]];
   }
   SplitviewVC *theSVC=(SplitviewVC *)self.splitViewController;
   theSVC.N=[NSNumber numberWithInt:N];
   theSVC.X1=[NSNumber numberWithDouble:X1];
   theSVC.X2=[NSNumber numberWithDouble:X2];
   theSVC.seriesArray=anArray;
   theSVC.needRefresh=YES;
    if (isPad)
        [((PadOVC *) theSVC.viewControllers.lastObject) refresh];
    else {
        // present display if is iPhone
        // --Not-- loading from storyboard, but self-building!
        PhoneOVC *newPOVC=[[PhoneOVC alloc] init];
        [self.navigationController pushViewController:newPOVC animated:YES];
    }
}

@end
