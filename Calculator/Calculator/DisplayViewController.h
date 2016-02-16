//
//  DisplayViewController.h
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController
@property(weak, nonatomic) IBOutlet UILabel *bottomDisplayLbl;
@property(weak, nonatomic) IBOutlet UILabel *radDisplay;

- (void)clearDisplayOfLowerLabel;
- (void)displayAnswers:(NSString *)string;
- (void)displayTextForLowerLabel:(NSString *)character;
- (void)setDisplayWithZero;
- (void)setRadianLabel;
@end
