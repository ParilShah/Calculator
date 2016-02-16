//
//  AdvancePanelView.m
//  Calculator
//
//  Created by Paril Shah on 2/7/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class manage AdvancePanelView.

#import "AdvancePanelView.h"
#import "Constants.h"

@interface AdvancePanelView ()
@property(strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsWithAlterFunctions;
@end

@implementation AdvancePanelView

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
        
    }
}

#pragma mark - Custom Methods

- (IBAction)performSecondFuntions:(id)sender{
    for (UIButton *buttons in self.buttonsWithAlterFunctions) {
        buttons.selected = !buttons.selected;
    }
}

- (IBAction)performSquare:(id)sender{
    [self sendCharacter:@"x2"withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performCube:(id)sender{
    [self sendCharacter:@"x3"withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performPowerOfy:(id)sender{
    [self sendCharacter:@"xy"withIdentifier:OPERATOR];
}
- (IBAction)performPowerOfe:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"yx" :@"ex";
    NSString *funtionString = sender.selected ? OPERATOR :DIRECTOPERATOR;
    [self sendCharacter:stringFuntion withIdentifier:funtionString];
}
- (IBAction)performPowerOfTen:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"2x" :@"10x";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performInverseOfX:(id)sender{
    [self sendCharacter:@"1/x" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performSquareRootOfX:(id)sender{
    [self sendCharacter:@"√x" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performThreeRootOfX:(id)sender{
    [self sendCharacter:@"3√x" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performYRootOfX:(id)sender{
    [self sendCharacter:@"y√x" withIdentifier:OPERATOR];
}
- (IBAction)performNaturalLog:(id)sender{
    [self sendCharacter:@"ln" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performLogBaseTen:(id)sender{
    [self sendCharacter:@"log 10" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performFactorial:(id)sender{
    [self sendCharacter:@"X!" withIdentifier:DIRECTOPERATOR];
}
- (IBAction)performSin:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"sin-1" :@"sin";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performCos:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"cos-1" :@"cos";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performTan:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"tan-1" :@"tan";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performE:(id)sender{
    [self sendCharacter:@"e" withIdentifier:DIGIT];
}
- (IBAction)performEE:(id)sender{
    [self sendCharacter:@"EE" withIdentifier:OPERATOR];
}

- (IBAction)performRad:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSString *stringFuntion = sender.selected ? @"Rad" :@"Deg";
    [self sendCharacter:stringFuntion withIdentifier:DEGREERADIAN];
}

- (IBAction)performSinh:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"sinh-1" :@"sinh";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performCosh:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"cosh-1" :@"cosh";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performTanh:(UIButton *)sender{
    NSString *stringFuntion = sender.selected ? @"tanh-1" :@"tanh";
    [self sendCharacter:stringFuntion withIdentifier:DIRECTOPERATOR];
}

- (IBAction)performPI:(id)sender{
    [self sendCharacter:@"Pi" withIdentifier:DIGIT];
}

- (IBAction)performRand:(id)sender{
    [self sendCharacter:@"Rand" withIdentifier:DIGIT];
}

// This method is used for respective characters to respective class.  
- (void)sendCharacter:(NSString *)string withIdentifier:(NSString *)identifier{
    if ([self.basicPanelDelegate respondsToSelector:@selector(sendBasicPanelCalculation:withIdentifier:)]) {
        [self.basicPanelDelegate sendBasicPanelCalculation:string withIdentifier:identifier];
    }
}

@end
