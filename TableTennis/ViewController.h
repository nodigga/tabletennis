//
//  ViewController.h
//  TableTennis
//
//  Created by nicholas.cardinal on 7/12/15.
//  Copyright (c) 2015 nicholas.cardinal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIPickerView *pickerView;
    

}

@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (nonatomic,retain) UIAlertView *alert;


@property (weak, nonatomic) IBOutlet UIButton *plusButton1;
@property (weak, nonatomic) IBOutlet UIButton *plusButton2;
@property (weak, nonatomic) IBOutlet UIButton *minusButton1;
@property (weak, nonatomic) IBOutlet UIButton *minusButton2;

@property (weak, nonatomic) IBOutlet UIButton *reset;


@end
