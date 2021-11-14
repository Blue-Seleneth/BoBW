//
//  Branch3OVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "Branch3OVC.h"
#import "SplitviewVC.h"

@interface Branch3OVC ()
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (nonatomic, strong) SplitviewVC *theSVC;

@end

@implementation Branch3OVC

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
    NSMutableString *textString=[NSMutableString stringWithCapacity:self.theSVC.seriesArray.count*7];
    for (int k=0;k<self.theSVC.seriesArray.count;k++)
       [textString appendFormat:@"%d\n",self.theSVC.seriesArray[k].intValue];
    self.myTextView.text=textString;
}

@end
