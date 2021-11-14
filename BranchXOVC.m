//
//  BranchXOVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "BranchXOVC.h"
#import "SplitviewVC.h"

@interface BranchXOVC ()
@property (nonatomic, strong) SplitviewVC *theSVC;
@property (weak, nonatomic) IBOutlet UILabel *branchXText;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

@end

@implementation BranchXOVC

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
    self.theSVC=(SplitviewVC *) self.splitViewController;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
       [self refresh];
}

-(void)refresh {
//    NSMutableString *str=[NSMutableString stringWithCapacity:512];
    switch (self.thisXType) {
        case typeX1:
            self.pageLabel.text=@"1";
            self.branchXText.text=[NSString stringWithFormat:@"%.4f - %.4f = %d\n",self.theSVC.X1.doubleValue*self.theSVC.X1.doubleValue,self.theSVC.X1.doubleValue,self.theSVC.N.intValue];
            break;
        case typeX2:
            self.pageLabel.text=@"2";
            self.branchXText.text=[NSString stringWithFormat:@"%.4f - %.4f = %d",self.theSVC.X2.doubleValue,1.0/self.theSVC.X2.doubleValue,self.theSVC.N.intValue];
            break;
    }
}

@end
