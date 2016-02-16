//
//  ViewController.m
//  Calculator
//
//  Created by Paril Shah on 2/4/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class is used as Parent Class.

#import "ViewController.h"
#import "AdvancePanelViewController.h"
#import "HandleDigitsandOperators.h"
#import "BasicPanelViewController.h"
#import "DisplayViewController.h"
#import "PerformOperations.h"
#import "Constants.h"

@interface ViewController ()
@property(strong, nonatomic) BasicPanelViewController *basicPanelVC;
@property(strong, nonatomic) AdvancePanelViewController *advancePanelVC;
@property(strong, nonatomic) DisplayViewController *displayPanelVC;
@property(strong, nonatomic) PerformOperations *objPerformOperations;
@property(strong, nonatomic) HandleDigitsandOperators *objHandleDigitsandOperators;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CalcBasicPanelIdentifier"]) {
        [self configureBasicPanelViewController:segue];
    } else if ([segue.identifier isEqualToString:@"CalcAdvancePanelIdentifier"]) {
        [self configureAdvancePanelViewController:segue];
    } else if ([segue.identifier isEqualToString:@"CalcDisplayPanelIdentifier"]) {
        [self configureDisplayPanelViewController:segue];
    }
}
#pragma mark - getter methods

- (PerformOperations *)objPerformOperations{
    if (!_objPerformOperations) {
        PerformOperations *performOperations = [PerformOperations new];
        _objPerformOperations = performOperations;
    }
    return _objPerformOperations;
}

- (HandleDigitsandOperators *)objHandleDigitsandOperators{
    if (!_objHandleDigitsandOperators) {
        HandleDigitsandOperators *handleDigitandOprators = [HandleDigitsandOperators new];
        _objHandleDigitsandOperators = handleDigitandOprators;
    }
    return _objHandleDigitsandOperators;
}

#pragma mark - Custom Methods

// This is used for managing Basic Panel View.
- (void)configureBasicPanelViewController:(UIStoryboardSegue *)segue{
    __weak ViewController *weakSelf = self;
    BasicPanelViewController *objBasicPanelViewController = [segue destinationViewController];
    [objBasicPanelViewController setGetBasicPanelCharacter:^(NSString *character, NSString *identifier){
        [weakSelf performStringManipulation:character withIdentifier:identifier];
    }];
    self.basicPanelVC = objBasicPanelViewController;
}

// This is used for managing Advance Panel View.
- (void)configureAdvancePanelViewController:(UIStoryboardSegue *)segue{
    __weak ViewController *weakSelf = self;
    AdvancePanelViewController *objAdvancePanelViewController = [segue destinationViewController];
    [objAdvancePanelViewController setGetAdvancePanelCharacter:^(NSString *character, NSString *identifier){
        [weakSelf performStringManipulation:character withIdentifier:identifier];
    }];

    self.advancePanelVC = objAdvancePanelViewController;
    
}

// This is used for managing Display Panel View.
- (void)configureDisplayPanelViewController:(UIStoryboardSegue *)segue{
    DisplayViewController *objDisplayViewController = [segue destinationViewController];
    self.displayPanelVC = objDisplayViewController;
}

// Use for managing all the characters and its identifier.
- (void)performStringManipulation:(NSString *)character withIdentifier:(NSString *)identifier{

    if ([identifier isEqualToString:CLEAR]) {
        [self clearPreviousValue];
    } else if ([identifier isEqualToString:ALLCLEAR]){
        [self clearAllValues];
    } else if ([identifier isEqualToString:ANSWER]) {
        [self performCalculations];
    } else if ([identifier isEqualToString:DECIMAL]){
        [self handleDecimalValue:character];
        [self displayString];
    } else if([identifier isEqualToString:DEGREERADIAN]) {
        [self.displayPanelVC setRadianLabel];
        [self.objPerformOperations setValueRadian:character];
    } else if ([identifier isEqualToString:PLUSMINUS]){
        [self handlePositiveOrNegativeValueWithCharacter:character];
        [self displayString];
    } else if ([identifier isEqualToString:DIRECTOPERATOR]){
        [self.objHandleDigitsandOperators handleDigitsWithString:character];
        [self performCalculations];
    } else if ([identifier isEqualToString:DIGIT]){
        [self.objHandleDigitsandOperators handleDigitsWithString:character];
        [self displayString];
    }if([identifier isEqualToString:OPERATOR]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"OperatorPress" object:nil];
        [self.displayPanelVC clearDisplayOfLowerLabel];
        [self doingCalculationFirst];
        [self.objHandleDigitsandOperators handleDigitsWithString:character];
    }
}

// Use for doing Calculation First.
- (void)doingCalculationFirst{
    if (self.objHandleDigitsandOperators.firstString.length && self.objHandleDigitsandOperators.secondString.length) {
        [self performCalculations];
    }
}

// Use for doing display String.
- (void)displayString {
    NSString *stringToDisplay;
    stringToDisplay = self.objHandleDigitsandOperators.operationString.length ? [NSString stringWithFormat:@"%@%@",self.objHandleDigitsandOperators.secondStringOperator,self.objHandleDigitsandOperators.secondString]:[NSString stringWithFormat:@"%@%@",self.objHandleDigitsandOperators.firstStringOperator,self.objHandleDigitsandOperators.firstString];
    [self.displayPanelVC displayTextForLowerLabel:stringToDisplay];
}

// Use for doing managing Decimal Value.
- (void)handleDecimalValue:(NSString *)character{
    [self.objHandleDigitsandOperators manageDecimalNumber:character];
}

// Use for doing managing Positive and Negative Value.
- (void)handlePositiveOrNegativeValueWithCharacter:(NSString *)character{
    [self.objHandleDigitsandOperators managePositivenegativeNumber:character];
}

// Use for doing clearing previous value.
- (void)clearPreviousValue{
    [self.displayPanelVC clearDisplayOfLowerLabel];
    [self.objHandleDigitsandOperators performClearValue];
}

// Use for doing all clear value.
- (void)clearAllValues{
    [self.objPerformOperations clearResult];
    [self.displayPanelVC clearDisplayOfLowerLabel];
    [self.objHandleDigitsandOperators performAllClearValue];
}

// Use for performing Calculations.
- (void)performCalculations{
    NSString *firstString = [NSString stringWithFormat:@"%@%@",self.objHandleDigitsandOperators.firstStringOperator,self.objHandleDigitsandOperators.firstString];
    NSString *secondString = [NSString stringWithFormat:@"%@%@",self.objHandleDigitsandOperators.secondStringOperator,self.objHandleDigitsandOperators.secondString];
    
    [self.objPerformOperations performCalculationsWithFirstString:firstString WithSecondString:secondString withOperator:self.objHandleDigitsandOperators.operationString];
    [self.displayPanelVC clearDisplayOfLowerLabel];
    [self.displayPanelVC displayAnswers:[self.objPerformOperations.result stringValue]];
    [self.objHandleDigitsandOperators setFirstNumberStringWithAnswer:[self.objPerformOperations.result stringValue]];
    [self.objPerformOperations clearResult];
}
@end
