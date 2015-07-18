//
//  ViewController.h
//  TableTennis
//
//  Created by nicholas.cardinal on 7/12/15.
//  Copyright (c) 2015 nicholas.cardinal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property(strong, nonatomic) NSString *strPlayerOne;

@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end
