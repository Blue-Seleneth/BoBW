//
//  Table1VC.m
//  BoBW
//
//  Created by Timothy Conover on 8/28/21.
//

#import "Table1VC.h"

@interface Table1VC ()
@property (weak, nonatomic) UIImageView *HeartImage;
@end

@implementation Table1VC

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
}

#pragma mark - TableViewDataSource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    NSInteger row=indexPath.row;
    if (row==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"typePickerRow" forIndexPath:indexPath];
       UIPickerView *thePicker=[cell.contentView viewWithTag:147];
       [thePicker selectRow:0 inComponent:0 animated:NO];    
       thePicker.dataSource=self;
       thePicker.delegate=self;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"typeBlankRow" forIndexPath:indexPath];
       self.HeartImage=[cell.contentView viewWithTag:148];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   NSInteger row=indexPath.row;
   CGFloat height[2]={290.0, 580.0};
   return height[row];
}

#pragma mark - PickerViewDataSource/Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 6;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *strArray=@[@"mB-T Shunt",@"Sano Shunt",@"Hybrid",@"Glenn",@"Fenestrated TCPC",@"TCPC"];
    return strArray[row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
   NSArray *imageNames=@[@"mB-TShunt_cleaned.png",@"Sano_cleaned.png",@"HybridStage1_cleaned.png",@"Glenn_cleaned.png",@"TCPCFenes_cleaned.png",@"TCPC_cleaned.png"];
   self.HeartImage.image=[UIImage imageNamed:imageNames[row]];
}

@end
// useless comment
// catastrophic, soul-crushing failure
// Schrodinger's cat must die  
