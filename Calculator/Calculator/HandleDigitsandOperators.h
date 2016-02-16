//
//  HandleDigitsandOperators.h
//  Calculator
//
//  Created by Paril Shah on 2/9/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandleDigitsandOperators : NSObject
@property(strong, nonatomic) NSString *firstString;
@property(strong, nonatomic) NSString *secondString;
@property(strong, nonatomic) NSString *operationString;
@property(strong, nonatomic) NSString *firstStringOperator;
@property(strong, nonatomic) NSString *secondStringOperator;
- (void)handleDigitsWithString:(NSString *)string;
- (BOOL)isPerformAnswer:(NSString *)character;
- (BOOL)isPressedClear:(NSString *)character;
- (BOOL)isPressedAllClear:(NSString *)character;
- (void)performClearValue;
- (void)performAllClearValue;
- (void)setFirstNumberStringWithAnswer:(NSString *)answerString;
- (void)managePositivenegativeNumber:(NSString *)character;
- (void)manageDecimalNumber:(NSString *)character;
@end
