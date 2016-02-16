//
//  HandleDigitsandOperators.m
//  Calculator
//
//  Created by Paril Shah on 2/9/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This Class is used for managing Numbers and Operators.

#import "HandleDigitsandOperators.h"

@interface HandleDigitsandOperators ()
@property(assign, nonatomic) BOOL isNumber;
@property(assign, nonatomic) BOOL isConstantNumbersAdded;
- (BOOL)isConstantNumbers:(NSString *)string;
@end

static const double valueOfe = 2.718281828;
static const double valueOfPI = 3.14159265;

@implementation HandleDigitsandOperators
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - getter methods

- (NSString *)firstString{
    if (!_firstString) {
         NSString *firstString= [NSString string];
        _firstString = firstString;
    }
    return _firstString;
}

- (NSString *)secondString{
    if (!_secondString) {
        _secondString = [NSString string];
    }
    return _secondString;
}

- (NSString *)operationString{
    if (!_operationString) {
        _operationString = [NSString string];
    }
    return _operationString;
}

- (NSString *)firstStringOperator{
    if (!_firstStringOperator) {
        NSString *firstString= [NSString string];
        _firstStringOperator = firstString;
    }
    return _firstStringOperator;
}

- (NSString *)secondStringOperator{
    if (!_secondStringOperator) {
        _secondStringOperator = [NSString string];
    }
    return _secondStringOperator;
}

#pragma mark - Custom Methods

// Use for handling string.
- (void)handleDigitsWithString:(NSString *)string {
    self.isNumber = [self isDigit:string];
    
    if (!self.isNumber && !self.firstString.length) {
        [self addFirstNumberWithString:string];
    }else if (self.isNumber && [self isOperatorEmpty]) {
        [self addFirstNumberWithString:string];
    }else if (self.isNumber && ![self isOperatorEmpty]){
        [self addSecondNumberWithString:string];
    } else if([self isOperator:string]){
        [self addOperationString:string];
    }
}

// Use for checking whether an operation string is empty or not.
- (BOOL)isOperatorEmpty {
    BOOL isSecondNumber;
    isSecondNumber = self.operationString.length == 0 ? TRUE : FALSE;
    return isSecondNumber;
}

// Use for checking REGEX for Operators.
- (BOOL)isOperator:(NSString *)string {
    BOOL isOperator;
    NSString *regex = @"([-+*/%]|(x2|x3|xy|ex|10x|1/x|√x|3√x|y√x|ln|log 10|X!|sin|cos|tan|EE|Rad|sinh|cosh|tanh|sin-1|cos-1|tan-1|sinh-1|cosh-1|tanh-1|log2|logy|2x|yx))";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    isOperator = [test evaluateWithObject:string];
    return isOperator;
}

// Use for checking REGEX for Digits.
- (BOOL)isDigit:(NSString *)string {
    BOOL isDigit;
    NSString *regex = @"^([0-9]*|e|Pi|Rand)$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    isDigit = [test evaluateWithObject:string];
    return isDigit;
}

// Use for adding First Number.
- (void)addFirstNumberWithString:(NSString *)character{
    if (!self.isConstantNumbersAdded) {
        if (![self isConstantNumbers:character]) {
            self.firstString = [self.firstString stringByAppendingString:character];
        } else {
            [self addConstantForFirstString:character];
        }
    }
}

// Use for adding Second Number.
- (void)addSecondNumberWithString:(NSString *)character{
    if (!self.isConstantNumbersAdded) {
        if (![self isConstantNumbers:character]) {
            self.secondString = [self.secondString stringByAppendingString:character];
        } else {
            [self addConstantForSecondString:character];
        }
    }
}

// Use for checking the string is with Decimal point or not.
- (BOOL)isStringWithDecimalPoints:(NSString *)string{
    BOOL isDecimal = [string containsString:@"."] ? TRUE : FALSE;
    return isDecimal;
}

// Use for adding operation string.
- (void)addOperationString:(NSString *)character{
    self.operationString = character;
    self.isConstantNumbersAdded = FALSE;
}

// Use for adding constant string for First Number.
- (void)addConstantForFirstString:(NSString *)string {
    self.firstString = [self performConstantWithCharacter:string];
}

// Use for adding constant string for Second Number.
- (void)addConstantForSecondString:(NSString *)string {
    self.secondString = [self performConstantWithCharacter:string];
}

// Use for calculating random number.
- (double)calculateRandomNo{
    double randomNumber = arc4random();
    return randomNumber;
}

// Use for getting constant value of e, Pi, random number.
- (NSString *)performConstantWithCharacter:(NSString *)string {
    NSNumber *myDoubleNumber;
    if([string isEqualToString:@"e"]){
        myDoubleNumber = [NSNumber numberWithDouble:valueOfe];
    }else if([string isEqualToString:@"Pi"]){
        myDoubleNumber = [NSNumber numberWithDouble:valueOfPI];
    }else {
        myDoubleNumber = [NSNumber numberWithDouble:[self calculateRandomNo]];
    }
    return [myDoubleNumber stringValue];
}

// Use for checking the number is = character.
- (BOOL)isPerformAnswer:(NSString *)character {
    return [character isEqualToString:@"="];
}

// Use for checking the number is C character.
- (BOOL)isPressedClear:(NSString *)character {
    return [character isEqualToString:@"C"];
}

// Use for checking the number is AC character.
- (BOOL)isPressedAllClear:(NSString *)character {
    return [character isEqualToString:@"AC"];
}

// Use for checking the number is Constant or not.
- (BOOL)isConstantNumbers:(NSString *)string{
    if ([string isEqualToString:@"e"] || [string isEqualToString:@"Pi"] || [string isEqualToString:@"Rand"]) {
        self.isConstantNumbersAdded = TRUE;
    } else {
        self.isConstantNumbersAdded = FALSE;
    }
    return self.isConstantNumbersAdded;
}

// Use for performing a Clear function.
- (void)performClearValue {
    if (self.firstString.length && !self.operationString.length) {
        self.firstString = @"";
        self.firstStringOperator = @"";
    }else if (self.firstString.length && self.operationString.length && !self.secondString.length){
        self.operationString = @"";
    }else if (self.secondString.length && self.operationString.length){
        self.secondString = @"";
        self.secondStringOperator = @"";
    }
    self.isConstantNumbersAdded = FALSE;
}

// Use for performing a AllClear function.
- (void)performAllClearValue {
    self.firstString = @"";
    self.operationString = @"";
    self.secondString = @"";
    self.isConstantNumbersAdded = FALSE;
}

// Use for setting answer as a first string.
- (void)setFirstNumberStringWithAnswer:(NSString *)answerString {
    self.firstString = answerString;
    self.secondString = @"";
    self.firstStringOperator = @"";
    self.secondStringOperator = @"";
}

// Use for managing positive and negative numbers.
- (void)managePositivenegativeNumber:(NSString *)character {
    if(self.operationString.length){
        self.secondStringOperator = character;
    } else {
        self.firstStringOperator = character;
    }
}

// Use for managing Decimal value of number.
- (void)manageDecimalNumber:(NSString *)character {
    if(self.operationString.length){
        if (![self isStringWithDecimalPoints:self.secondString]) {
            self.secondString = [NSString stringWithFormat:@"%@.",self.secondString];
        }
    } else {
        if (![self isStringWithDecimalPoints:self.firstString]) {
            self.firstString = [NSString stringWithFormat:@"%@.",self.firstString];
        }
    }
}

@end
