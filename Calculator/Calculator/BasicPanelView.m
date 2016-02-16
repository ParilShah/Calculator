//
//  BasicPanelView.m
//  Calculator
//
//  Created by Paril Shah on 2/6/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class manages BasicPanelView.

#import "BasicPanelView.h"
#import "Constants.h"

@interface BasicPanelView()
- (IBAction)performC:(id)sender;
- (IBAction)performPlusMinusSign:(id)sender;
- (IBAction)performPercentage:(id)sender;
- (IBAction)performDivision:(id)sender;
- (IBAction)performMultiplication:(id)sender;
- (IBAction)performSubtraction:(id)sender;
- (IBAction)performAddition:(id)sender;
- (IBAction)performAnswer:(id)sender;
- (IBAction)performDecimal:(id)sender;
- (IBAction)pressZero:(id)sender;
- (IBAction)pressOne:(id)sender;
- (IBAction)pressTwo:(id)sender;
- (IBAction)pressThree:(id)sender;
- (IBAction)pressFour:(id)sender;
- (IBAction)pressFive:(id)sender;
- (IBAction)pressSix:(id)sender;
- (IBAction)pressSeven:(id)sender;
- (IBAction)pressEight:(id)sender;
- (IBAction)pressNine:(id)sender;

@property(weak, nonatomic) IBOutlet UIButton *buttonPlusMinus;
@end

@implementation BasicPanelView

- (void)awakeFromNib {
    [super awakeFromNib];
    if(self.subviews.count == 0){
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
        
        UIView *view = views[0];
        [self addSubview:view];
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
        
        [self addConstraints:@[ leading, top, trailing, bottom ]];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:)
                                                     name:@"OperatorPress"
                                                   object:nil];


    }
}


#pragma mark - NotificationCenter

- (void)receiveNotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"OperatorPress"]){
        [self.buttonPlusMinus setSelected:NO];
    }
}

#pragma mark - Custom Methods

- (IBAction)performAC:(id)sender{
    [self sendCharacter:@"AC" withIdentifier:ALLCLEAR];
}

- (IBAction)performC:(id)sender{
    [self sendCharacter:@"C" withIdentifier:CLEAR];
}

- (IBAction)performPlusMinusSign:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSString *stringFunc;
    stringFunc = sender.selected ? @"-":@"";
    [self sendCharacter:stringFunc withIdentifier:PLUSMINUS];
}

- (IBAction)performPercentage:(id)sender{
    [self sendCharacter:@"%" withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performDivision:(id)sender{
    [self sendCharacter:@"/" withIdentifier:OPERATOR];
}

- (IBAction)performMultiplication:(id)sender{
    [self sendCharacter:@"*" withIdentifier:OPERATOR];
}

- (IBAction)performSubtraction:(id)sender{
    [self sendCharacter:@"-" withIdentifier:OPERATOR];
}

- (IBAction)performAddition:(id)sender{
    [self sendCharacter:@"+" withIdentifier:OPERATOR];
}

- (IBAction)performAnswer:(id)sender{
    [self sendCharacter:@"=" withIdentifier:ANSWER];
}
- (IBAction)performDecimal:(id)sender{
    [self sendCharacter:@"." withIdentifier:DECIMAL];
}
- (IBAction)pressZero:(id)sender{
    [self sendCharacter:@"0" withIdentifier:DIGIT];
}
- (IBAction)pressOne:(id)sender{
    [self sendCharacter:@"1" withIdentifier:DIGIT];
}
- (IBAction)pressTwo:(id)sender{
    [self sendCharacter:@"2" withIdentifier:DIGIT];
}
- (IBAction)pressThree:(id)sender{
    [self sendCharacter:@"3" withIdentifier:DIGIT];
}
- (IBAction)pressFour:(id)sender{
    [self sendCharacter:@"4" withIdentifier:DIGIT];
}
- (IBAction)pressFive:(id)sender{
    [self sendCharacter:@"5" withIdentifier:DIGIT];
}
- (IBAction)pressSix:(id)sender{
    [self sendCharacter:@"6" withIdentifier:DIGIT];
}
- (IBAction)pressSeven:(id)sender{
    [self sendCharacter:@"7" withIdentifier:DIGIT];
}
- (IBAction)pressEight:(id)sender{
    [self sendCharacter:@"8" withIdentifier:DIGIT];
}
- (IBAction)pressNine:(id)sender{
    [self sendCharacter:@"9" withIdentifier:DIGIT];
}

// This method is used for respective characters to respective class.
- (void)sendCharacter:(NSString *)string withIdentifier:(NSString *)identifier{
    if ([self.basicPanelDelegate respondsToSelector:@selector(sendBasicPanelCalculation:withIdentifier:)]) {
        [self.basicPanelDelegate sendBasicPanelCalculation:string withIdentifier:identifier];
    }
}

@end
