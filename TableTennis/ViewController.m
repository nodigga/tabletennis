//
//  ViewController.m
//  TableTennis
//
//  Created by nicholas.cardinal on 7/12/15.
//  Copyright (c) 2015 nicholas.cardinal. All rights reserved.
//

#import "ViewController.h"

static NSString *plusImage = @"plus.png";
static NSString *minusImage = @"minus.png";
static NSString *resetImage = @"reset.png";



@interface ViewController ()

@property(nonatomic, strong) NSMutableArray *playerOneString;
@property(nonatomic, strong) NSMutableArray *playerTwoString;

@property(nonatomic, strong) NSString *winner;
@property(nonatomic) BOOL showsSelectionIndicator;

@property(nonatomic)int firstComponentRow;
@property(nonatomic)int secondComponentRow;

@end

@implementation ViewController

@synthesize pickerView;
@synthesize alert;



- (IBAction)resetGame:(id)sender

{

    [self.pickerView selectRow:0 inComponent:0 animated:YES];
    [self.pickerView selectRow:0 inComponent:1 animated:YES];


}


-(IBAction)IncreaseRowOne:(id)sender
{

    [self.pickerView selectRow:[self.pickerView selectedRowInComponent:0] +1 inComponent:0 animated:YES];
    _firstComponentRow = [self.pickerView selectedRowInComponent:0];
    _secondComponentRow = [self.pickerView selectedRowInComponent:1];
    
    [self determineWinner];

}

- (IBAction)DecreaseRowOne:(id)sender

{
    
    [self.pickerView selectRow:[self.pickerView selectedRowInComponent:0] -1 inComponent:0 animated:YES];
    _firstComponentRow = [self.pickerView selectedRowInComponent:0];
    _secondComponentRow = [self.pickerView selectedRowInComponent:1];
    
    [self determineWinner];
    
    
}

- (IBAction)IncreaseRowTwo:(id)sender

{
    
    [self.pickerView selectRow:[self.pickerView selectedRowInComponent:1] +1 inComponent:1 animated:YES];
    _firstComponentRow = [self.pickerView selectedRowInComponent:0];
    _secondComponentRow = [self.pickerView selectedRowInComponent:1];
    
    [self determineWinner];
}


- (IBAction)DecreaseRowTwo:(id)sender

{
    
 [self.pickerView selectRow:[self.pickerView selectedRowInComponent:1] -1 inComponent:1 animated:YES];
    _firstComponentRow = [self.pickerView selectedRowInComponent:0];
    _secondComponentRow = [self.pickerView selectedRowInComponent:1];
    
    [self determineWinner];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Table Tennis";
    // Do any additional setup after loading the view from its nib.
    
    //self.winnerLabel.text = @"Game In Progress";
    
    
//    [self.plusButton1 setBackgroundImage:[UIImage imageNamed:plusImage] forState:UIControlStateNormal];
//    [self.plusButton2 setBackgroundImage:[UIImage imageNamed:plusImage] forState:UIControlStateNormal];
//    
//    [self.minusButton1 setBackgroundImage:[UIImage imageNamed:minusImage] forState:UIControlStateNormal];
//    [self.minusButton2 setBackgroundImage:[UIImage imageNamed:minusImage] forState:UIControlStateNormal];
    
    [self.reset setBackgroundImage:[UIImage imageNamed:resetImage] forState:UIControlStateNormal];
    
    
    _playerOneString = [[NSMutableArray alloc]init];
    _playerTwoString = [[NSMutableArray alloc]init];
    
    
    
    for (int x = 0; x<101; x++)
    {
    
        
        NSString *string = [NSString stringWithFormat:@"%d", x];
        [_playerOneString addObject:string];
        [_playerTwoString addObject:string];
        
        
        
        // NSLog(@"%d", x);
    }
    
    
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float pickerWidth = screenWidth * 4/5;
    
    // Calculate the starting x coordinate.
    float xPoint = screenWidth / 2 - pickerWidth / 2;
    
    // Init the picker view.
    pickerView = [[UIPickerView alloc] init];
    
    // Set the delegate and datasource. Don't expect picker view to work
    // correctly if you don't set it.
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    
    // Set the picker's frame. We set the y coordinate to 50px.
    [pickerView setFrame: CGRectMake(xPoint, 150.0f, pickerWidth, 216.0f)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    pickerView.showsSelectionIndicator = YES;
    

    
    
    // OK, we are ready. Add the picker in our view.
    [self.view addSubview: pickerView];

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
    
   return _playerOneString.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
        return [_playerOneString objectAtIndex:row];
        return [_playerTwoString objectAtIndex:row];

}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    
    _firstComponentRow = [self.pickerView selectedRowInComponent:0];
    _secondComponentRow = [self.pickerView selectedRowInComponent:1];
    
   
    NSLog(@"%ld", (long)_firstComponentRow);
    NSLog(@"%ld", (long)_secondComponentRow);
    
    //self.winnerLabel.text = @"Game In Progress";

    [self determineWinner];
    
}


-(void)determineWinner

{
    
    if(_firstComponentRow > 10  || _secondComponentRow > 10)
        
    {
        
        if(_firstComponentRow >_secondComponentRow && _firstComponentRow - _secondComponentRow >=2)
        {
            
            NSLog(@"Player One Wins!");
            NSString *winner =@"Player One Wins!";
            
            alert = [[UIAlertView alloc] initWithTitle:winner message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
        
        if(_secondComponentRow > _firstComponentRow && _secondComponentRow - _firstComponentRow >= 2)
        {
            
            NSLog(@"Player Two Wins!");
            NSString *winner = @"Player Two Wins!";
            
            alert = [[UIAlertView alloc] initWithTitle:winner message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
        }
    }



}


@end
