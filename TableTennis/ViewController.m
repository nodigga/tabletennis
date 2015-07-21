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


@property(nonatomic,strong)UIView *mainView;
@property(nonatomic, strong) UIScrollView *scroll;

@property(nonatomic, strong) NSMutableArray *playerOneString;
@property(nonatomic, strong) NSMutableArray *playerTwoString;

@property(nonatomic, strong) NSString *winner;
@property(nonatomic) BOOL showsSelectionIndicator;

@property(nonatomic)int firstComponentRow;
@property(nonatomic)int secondComponentRow;

@end

@implementation ViewController

//@synthesize pickerView;
@synthesize alert;

@synthesize mainView;

- (IBAction)resetGame:(id)sender

{

   


}


-(IBAction)IncreaseRowOne:(id)sender
{

  
    
    [self determineWinner];

}

- (IBAction)DecreaseRowOne:(id)sender

{
    
    
    
    [self determineWinner];
    
    
}

- (IBAction)IncreaseRowTwo:(id)sender

{
 
    
    [self determineWinner];
}


- (IBAction)DecreaseRowTwo:(id)sender

{
    

    
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
    
    
    
    
    
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)loadView
{
    NSLog(@"In loadview");
    self.mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = mainView;
    mainView.backgroundColor = [UIColor yellowColor];

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 768, 500)];
    scroll.backgroundColor = [UIColor redColor];
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(768*5,500);
    [mainView addSubview:scroll];
    
    

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
