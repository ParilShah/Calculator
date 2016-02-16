//
//  DisplayViewController.m
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class is used for displaying Panel.

#import "DisplayViewController.h"
#import "Constants.h"

@interface DisplayViewController ()
@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

// Displaying Label with answer
- (void)displayTextForLowerLabel:(NSString *)character {    
    [self.bottomDisplayLbl setText:character];
}

// Clear Display Label.
- (void)clearDisplayOfLowerLabel {
    [self setDisplayWithZero];
}

// Displaying Label with answer
- (void)displayAnswers:(NSString *)string{
    [self.bottomDisplayLbl setText:string];
}

// Reseting Display with Zero.
- (void)setDisplayWithZero {
    [self.bottomDisplayLbl setText:@"0"];
}

// Reseting Label to show whether the value will be Radian or Degree.
- (void)setRadianLabel {
    if([self.radDisplay.text isEqualToString:@"Rad"]){
        self.radDisplay.text = @"";
    } else {
        self.radDisplay.text = @"Rad";
    }
}
@end
