//
//  PerformOperations.h
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PerformOperations : NSObject
@property(strong, nonatomic) NSNumber *result;
- (void)setValueRadian:(NSString *)string;
- (void)clearResult;
- (void)performCalculationsWithFirstString:(NSString *)firstString WithSecondString:(NSString *)secondString withOperator:(NSString *)oprator;
@end
