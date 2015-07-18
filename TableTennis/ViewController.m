//
//  ViewController.m
//  TableTennis
//
//  Created by nicholas.cardinal on 7/12/15.
//  Copyright (c) 2015 nicholas.cardinal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSArray *_pickerDataPlayerOne;
    NSArray *_pickerDataPlayerTwo;
    NSString *winner;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.winnerLabel.text = @"Game In Progress";
    
    _pickerDataPlayerOne = @[@"0", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12",@"13", @"14", @"15", @"16", @"17", @"18",@"19", @"20", @"21", @"22", @"23", @"24" ];
    
    _pickerDataPlayerTwo = @[@"0", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12",@"13", @"14", @"15", @"16", @"17", @"18",@"19", @"20", @"21", @"22", @"23", @"24" ];
    
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    // The number of columns of data

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerDataPlayerOne.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
        return [_pickerDataPlayerOne objectAtIndex:row];
        return [_pickerDataPlayerTwo objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    
    NSInteger firstComponentRow = [self.picker selectedRowInComponent:0];
    NSInteger secondComponentRow = [self.picker selectedRowInComponent:1];
    
   
    NSLog(@"%ld", (long)firstComponentRow);
    NSLog(@"%ld", (long)secondComponentRow);
    
    self.winnerLabel.text = @"Game In Progress";
    
    if(firstComponentRow >9  || secondComponentRow >9)
    
    {
    
        
        if(firstComponentRow >secondComponentRow && firstComponentRow - secondComponentRow >1){
        
        
            NSLog(@"Player One Wins!");
        
            NSString *winner =@"Player One Wins!";
            
            self.winnerLabel.text = winner;
        }
    
        if(secondComponentRow >firstComponentRow && secondComponentRow - firstComponentRow >1){
        
        NSLog(@"Player Two Wins!");
            
            NSString *winner = @"Player Two Wins!";
            self.winnerLabel.text = winner;
            
        }
        
        
    }
    
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
