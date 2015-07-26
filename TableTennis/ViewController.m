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


@property(nonatomic, strong) UIScrollView *scroll;


@property(nonatomic, strong) NSMutableArray *playerOneString;
@property(nonatomic, strong) NSMutableArray *playerTwoString;

@property(nonatomic, strong) NSString *winner;
@property(nonatomic) BOOL showsSelectionIndicator;

@property(nonatomic)int firstComponentRow;
@property(nonatomic)int secondComponentRow;

@property(nonatomic, strong) UIView *testView;
@property(nonatomic, strong) UILabel *testLabel;

@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic)int pageCount;


@end

@implementation ViewController

//@synthesize pickerView;
@synthesize alert;
@synthesize pageControl;

//@synthesize mainView;

- (IBAction)resetGame:(id)sender

{

   


}


-(IBAction)IncreaseRowOne:(id)sender
{

   //[self.scroll setContentOffset:CGPointMake(self.scroll.frame.size.width*2, 0.0f) animated:YES];
    pageControl.currentPage = 5;
    
    [self determineWinner];

}

- (IBAction)DecreaseRowOne:(id)sender

{
    
    pageControl.currentPage = 5;
    
    [self determineWinner];
    
    
}

- (IBAction)IncreaseRowTwo:(id)sender

{
 
    
    [self determineWinner];
}


- (IBAction)DecreaseRowTwo:(id)sender

{
    
    ;
    
    [self determineWinner];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Table Tennis";
    // Do any additional setup after loading the view from its nib.
    
    
    _playerOneString = [[NSMutableArray alloc]init];
    _playerTwoString = [[NSMutableArray alloc]init];
    
   // NSInteger pageCount = _playerOneString.count;
    
    
    for (int x = 0; x<10; x++)
    {
        
        
        NSString *string = [NSString stringWithFormat:@"%d", x];
        [_playerOneString addObject:string];
        [_playerTwoString addObject:string];
        
        
        
        // NSLog(@"%d", x);
    }
    
    
    //self.winnerLabel.text = @"Game In Progress";
    
    
//    [self.plusButton1 setBackgroundImage:[UIImage imageNamed:plusImage] forState:UIControlStateNormal];
//    [self.plusButton2 setBackgroundImage:[UIImage imageNamed:plusImage] forState:UIControlStateNormal];
//    
//    [self.minusButton1 setBackgroundImage:[UIImage imageNamed:minusImage] forState:UIControlStateNormal];
//    [self.minusButton2 setBackgroundImage:[UIImage imageNamed:minusImage] forState:UIControlStateNormal];
    
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, screenWidth/2, screenHeight/2)];
        scroll.backgroundColor = [UIColor darkGrayColor];
        scroll.pagingEnabled = YES;
        scroll.contentSize = CGSizeMake(screenWidth/4,screenHeight/2*15);
        scroll.delegate = self;
        scroll.showsVerticalScrollIndicator = NO;
    
    
        UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 90, scroll.frame.size.width, 20)];
        //pageControl.numberOfPages = scroll.contentSize.width/scroll.frame.size.width;
        pageControl.numberOfPages = 15;
    
        pageControl.currentPage = 0;
    
        [self.view addSubview:pageControl];
        pageControl.backgroundColor = [UIColor redColor];
    
    
    
        //[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    
   // NSLog(@"%d",_playerOneString.count);
    
    
    [self.view addSubview:scroll];
    
    //float scrollWidth = [UIScreen scroll.UIScreen];
   
    //UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200,200)];
    //UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth,screenHeight*10)];
    
    for(int x =0; x<15; x++)
    
    {
    
        int y = x+1;
        // NSLog(@"%d", x);
        NSString *string = [NSString stringWithFormat:@"%d", x];
        //NSLog(@"%@",string);
        //testLabel.frame = CGRectMake(0, 0, screenWidth, screenHeight*x); //x,y,width,height
        UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -175, screenWidth/2,screenHeight*y)];
        
        testLabel.textAlignment = UITextAlignmentCenter;
        testLabel.textColor = [UIColor whiteColor];
        NSLog(@"%@",string);
        
        testLabel.text = string;
    
        [testLabel setFont:[UIFont fontWithName:@"Arial" size:200]];
        [scroll addSubview:testLabel];
        
    }
    
    
    
    [self.reset setBackgroundImage:[UIImage imageNamed:resetImage] forState:UIControlStateNormal];
    

    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scroll.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = self.scroll.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page; // you need to have a **iVar** with getter for pageControl
}


@end
