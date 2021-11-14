//
//  PadOVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "PadOVC.h"
#import "SplitviewVC.h"

@interface PadOVC ()
@property (weak, nonatomic) IBOutlet UILabel *superLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) SplitviewVC *theSVC;
@end

@implementation PadOVC

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
   self.theSVC=(SplitviewVC *) self.splitViewController;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.theSVC.needRefresh) {
       [self refresh];
        self.theSVC.needRefresh=NO;
    }
}

- (void) refresh {
   NSMutableString *str=[NSMutableString stringWithCapacity:512];
   // data which came from launching (AppDelegate)
   self.superLabel.text=self.theSVC.superString;
   self.feedbackLabel.text=@"OK Now";
   // results X1 and X2 that were given from Table2VC
   [str appendFormat:@"Results for N = %d\n",self.theSVC.N.intValue];
   [str appendFormat:@"%.4f - %.4f = %d\n",self.theSVC.X1.doubleValue*self.theSVC.X1.doubleValue,self.theSVC.X1.doubleValue,self.theSVC.N.intValue];
   [str appendFormat:@"%.4f - %.4f = %d",self.theSVC.X2.doubleValue,1.0/self.theSVC.X2.doubleValue,self.theSVC.N.intValue];
   self.resultsLabel.text=str;
   // array of results with arbitrary length (3N+1 series) from Table2VC
   NSMutableString *textString=[NSMutableString stringWithCapacity:self.theSVC.seriesArray.count*7];
   for (int k=0;k<self.theSVC.seriesArray.count;k++)
      [textString appendFormat:@"%d\n",self.theSVC.seriesArray[k].intValue];
   self.textView.text=textString;
}

@end
