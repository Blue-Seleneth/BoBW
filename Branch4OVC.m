//
//  Branch4OVC.m
//  BoBW
//
//  Created by Timothy Conover on 10/4/21.
//

#import "Branch4OVC.h"
#import "SplitviewVC.h"

@interface Branch4OVC ()
@property UIView *box;
@end

@implementation Branch4OVC

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
}

-(void)loadView{
    // iOS calls this upon loading view
    // self-build the interior things
    UIScrollView *theSV=[[UIScrollView alloc] init];
    theSV.backgroundColor=UIColor.whiteColor;
    theSV.contentSize=CGSizeMake(446, 700);
    theSV.scrollEnabled=YES;
    theSV.minimumZoomScale=0.2;
    theSV.maximumZoomScale=5;
    theSV.delegate=self;
    self.view=theSV;
    self.box=[[UIView alloc] init];
    self.box.frame=CGRectMake(0, 0, 446, 700);
    self.box.backgroundColor=UIColor.whiteColor;
    [self.view addSubview:self.box];
    UIImage *img = [UIImage imageNamed:@"Sano_cleaned.png"];
    UIImageView *imv=[[UIImageView alloc] initWithImage:img];
    [self.box addSubview:imv];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGRect bounds=UIScreen.mainScreen.bounds;
    NSLog(@"%f\t%f",bounds.size.width,bounds.size.height);
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.box;
}

@end
