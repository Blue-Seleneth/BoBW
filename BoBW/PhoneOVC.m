//
//  PhoneOVC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "PhoneOVC.h"
#import "SplitviewVC.h"
#import "BranchXOVC.h"
#import "Branch3OVC.h"
#import "Branch4OVC.h"

@interface PhoneOVC ()
@property (nonatomic, strong) SplitviewVC *theSVC;
@property  IBOutlet UILabel *superLabel;
@property  IBOutlet UILabel *feedbackLabel;
@property  IBOutlet UILabel *NLabel;
@property  IBOutlet UIButton *button1;
@property  IBOutlet UIButton *button2;
@property  IBOutlet UIButton *button3;
@property UIButton *button4;
@end

@implementation PhoneOVC {
    int N;
    double X1, X2;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
}

-(void)loadView{
    // iOS calls this upon loading view
    // self-build the interior things
    self.view=[[UIScrollView alloc] init];
    self.view.backgroundColor=UIColor.whiteColor;
//       CGSize size=((UIScrollView *)self.view).contentSize;
    CGSize size=self.preferredContentSize;
    size.height=1100;   // increase height to 1100, leaving same width
    ((UIScrollView *)self.view).contentSize=size;
    UIView *box=[[UIView alloc] init];
    box.frame=CGRectMake(50, 100, 220, 70);
    box.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];
    [self.view addSubview:box];
    self.superLabel=[[UILabel alloc] init];
    self.superLabel.frame=CGRectMake(8, 1, 96, 68);
    self.superLabel.numberOfLines=2;
    self.superLabel.text=[NSString stringWithFormat:@"Super\nLabel"];
    [box addSubview:self.superLabel];
    self.feedbackLabel=[[UILabel alloc] init];
    self.feedbackLabel.frame=CGRectMake(118, 1, 96, 68);
    self.feedbackLabel.numberOfLines=2;
    self.feedbackLabel.text=[NSString stringWithFormat:@"Not\nYet!"];
    [box addSubview:self.feedbackLabel];
    self.NLabel=[[UILabel alloc] init];
    self.NLabel.frame=CGRectMake(102, 474, 110, 21);
    self.NLabel.text=@"N=12345678";
    [self.view addSubview:self.NLabel];
    self.button1=[UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.frame=CGRectMake(123, 600, 70, 33);
    [self.button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    self.button1.titleLabel.font=[UIFont systemFontOfSize:17];
    [self.button1 addTarget:self action: @selector(button1Press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    self.button2=[UIButton buttonWithType:UIButtonTypeSystem];
    self.button2.frame=CGRectMake(123, 730, 70, 33);
    [self.button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    self.button2.titleLabel.font=[UIFont systemFontOfSize:17];
    [self.button2 addTarget:self action: @selector(button2Press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    self.button3=[UIButton buttonWithType:UIButtonTypeSystem];
    self.button3.frame=CGRectMake(123, 870, 70, 33);
    [self.button3 setTitle:@"Button 3" forState:UIControlStateNormal];
    self.button3.titleLabel.font=[UIFont systemFontOfSize:17];
    [self.button3 addTarget:self action: @selector(button3Press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button3];
    self.button4=[UIButton buttonWithType:UIButtonTypeSystem];
    self.button4.frame=CGRectMake(123, 930, 70, 33);
    [self.button4 setTitle:@"Button 4" forState:UIControlStateNormal];
    self.button4.titleLabel.font=[UIFont systemFontOfSize:17];
    [self.button4 addTarget:self action: @selector(button4Press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button4];
    UILabel *blbl=[[UILabel alloc] init];
    blbl.frame=CGRectMake(10, 1080, 110, 17);
    blbl.text=@"bottom";
    [self.view addSubview:blbl];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.theSVC=(SplitviewVC *) self.splitViewController;
    if (self.theSVC.needRefresh) {
       [self refresh];
        self.theSVC.needRefresh=NO;
    }
}

- (void) refresh {
   // data which came from launching (AppDelegate)
   self.superLabel.text=self.theSVC.superString;
    // later data
    N=self.theSVC.N.intValue;
    X1=self.theSVC.X1.doubleValue;
    X2=self.theSVC.X2.doubleValue;
   self.feedbackLabel.text=@"OK Now";
   self.NLabel.text=[NSString stringWithFormat:@"N = %d",N];
   self.button1.enabled=YES;
   self.button2.enabled=YES;
   self.button3.enabled=YES;
}

- (void)button1Press:(UIButton *)sender {
    BranchXOVC *ovc=(BranchXOVC *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BranchXOVC"];
    ovc.thisXType=typeX1;
    [self.navigationController pushViewController:ovc animated:YES];
}

- (void)button2Press:(UIButton *)sender {
    BranchXOVC *ovc=(BranchXOVC *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BranchXOVC"];
    ovc.thisXType=typeX2;
    [self.navigationController pushViewController:ovc animated:YES];
}

- (void)button3Press:(UIButton *)sender {
    Branch3OVC *ovc=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Branch3OVC"];
    [self.navigationController pushViewController:ovc animated:YES];
}

- (void)button4Press:(UIButton *)sender {
    Branch4OVC *ovc=[[Branch4OVC alloc] init];
    [self.navigationController pushViewController:ovc animated:YES];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"toX1"]) {
//        ((BranchXOVC *)segue.destinationViewController).thisXType=typeX1;
//    }
//    else if ([segue.identifier isEqualToString:@"toX2"]) {
//        ((BranchXOVC *)segue.destinationViewController).thisXType=typeX2;
//    }
//}

@end

