//
//  PerformOperations.m
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//
//  Decription : This class is used for calculating all the equations.


#import "PerformOperations.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface PerformOperations()
@property(assign, nonatomic) BOOL isRadian;
@property(strong, nonatomic) NSString *firstString;
@property(strong, nonatomic) NSString *secondString;
@property(strong, nonatomic) NSString *operationString;
@property(strong, nonatomic) NSNumberFormatter *formatNumber;
@property(strong, nonatomic) NSDictionary *dictionaryOfOperators;
@end

static NSString *const FIRST_NUMBER = @"FirstNumber";
static NSString *const SECOND_NUMBER = @"SecondNumber";
static NSString *const PLIST_NAME = @"FunctionsWithCharacters";

@implementation PerformOperations

- (instancetype)init{
    self = [super init];
    if (self) {
        self.result = [NSNumber numberWithInteger:0];
    }
    return self;
}

- (void)performCalculationsWithFirstString:(NSString *)firstString WithSecondString:(NSString *)secondString withOperator:(NSString *)operator{
    if (firstString.length && operator.length) {
        NSDictionary *dictionary = @{FIRST_NUMBER:firstString, SECOND_NUMBER:secondString};
        NSString *functionName = self.dictionaryOfOperators[operator];
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(functionName) withObject:dictionary];
        #pragma clang diagnostic pop
    }
}


#pragma mark - getter methods

- (NSDictionary *)dictionaryOfOperators{
    if (!_dictionaryOfOperators) {
        NSString *path = [[NSBundle mainBundle] pathForResource:PLIST_NAME ofType:@"plist"];
        _dictionaryOfOperators = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return _dictionaryOfOperators;
}

- (NSNumberFormatter *)formatNumber{
    if (!_formatNumber) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        _formatNumber = f;
    }
    return _formatNumber;
}

#pragma Custom Methods 

// Use for setting flag, is Radian or Degree.
- (void)setValueRadian:(NSString *)string {
    if ([string isEqualToString:@"Rad"]) {
        self.isRadian = TRUE;
    } else {
        self.isRadian = FALSE;
    }
}

// Use to reset the result variable value.
- (void)clearResult {
    self.result = [NSNumber numberWithInt:0];
}

// Use for conversion from Degree to Radian
- (double)convertionDegreeRadian:(NSNumber *)number{
    double convertedNumber;
    if (self.isRadian) {
        convertedNumber = [number doubleValue];
    }else{
        convertedNumber = DEGREES_TO_RADIANS([number doubleValue]);
    }
    return convertedNumber;
}

// Use for doing addition between two numbers.
- (void)performAddtions:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithFloat:([myFirstNumber doubleValue] + [mySecondNumber doubleValue])];
}

// Use for doing subtraction between two numbers.
- (void)performSubtractions:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:([myFirstNumber doubleValue] - [mySecondNumber doubleValue])];
}

// Use for doing multiplication between two numbers.
- (void)performMultiplication:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:([myFirstNumber doubleValue] * [mySecondNumber doubleValue])];

}

// Use for doing division between two numbers.
- (void)performDivisionWith:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:([myFirstNumber doubleValue] / [mySecondNumber doubleValue])];

}

// Use for doing percentage of a number.
- (void)performPercentage:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:([myFirstNumber doubleValue] / 100)];
}

// Use for doing Square of a number.
- (void)performSquare:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:([myFirstNumber doubleValue] * [myFirstNumber doubleValue])];
}

// Use for doing Cube of a number.
- (void)peformCube:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:pow([myFirstNumber doubleValue],3)];
}

// Use for doing Power of Y of a number.
- (void)perforrmPowerOfY:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:pow([myFirstNumber doubleValue],[mySecondNumber doubleValue])];
}

// Use for doing Power X of a number.
- (void)perforrmPowerOfX:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:pow([mySecondNumber doubleValue],[myFirstNumber doubleValue])];
}

// Use for doing Power Y of a e(Constant).
- (void)performPowerOfe:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:exp([myFirstNumber doubleValue])];

}

// Use for doing Power Y of a Ten.
- (void)performPowerofTen:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:pow(10, [myFirstNumber doubleValue])];
}

// Use for doing Power Y of a Two.
- (void)performPowerofTwo:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:pow(2, [myFirstNumber doubleValue])];
}

// Use for doing inverse of a number.
- (void)performInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:1/[myFirstNumber doubleValue]];

}

// Use for doing square root of a number.
- (void)performSquareRoot:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:sqrt([myFirstNumber doubleValue])];

}

// Use for doing cube root of a number.
- (void)peformSquareRootThree:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    int floatNumber = ([myFirstNumber floatValue] < 0 && (3 % 2 == 1)) ? -1 : 1;
    float root = pow([myFirstNumber doubleValue] * floatNumber, 1.0/3.0) * floatNumber;
    self.result = [NSNumber numberWithDouble:root];
    
}

// Use for doing Y root of a number.
- (void)perforrmSquareRootOfY:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    int number = ([myFirstNumber doubleValue] < 0 && ([mySecondNumber integerValue] % 2 == 1)) ? -1 : 1;
    float root = pow([myFirstNumber doubleValue], 1.0/[mySecondNumber doubleValue]) * number;
    self.result = [NSNumber numberWithDouble:root];
}

// Use for doing natural logarithm of a number.
- (void)performNaturalLog:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:log([myFirstNumber doubleValue])];
}

// Use for doing logarithm of a number.
- (void)performlogBaseTen:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:log10f([myFirstNumber doubleValue])];
}

// Use for doing Factorial of a number.
- (void)performFactorial:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    int c,fact = 1;
    for (c = 1; c <= [myFirstNumber integerValue]; c++)
        fact = fact * c;
    self.result = [NSNumber numberWithFloat:fact];
}

// Use for doing Sin of a number.
- (void)performSin:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:sin(number)];
}

// Use for doing Cos of a number.
- (void)performCos:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:cos(number)];
}

// Use for doing Tan of a number.
- (void)performTan:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:tan(number)];
}

// Use for doing EE of a number.
- (void)performEE:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:[myFirstNumber doubleValue] * powf(10, [mySecondNumber doubleValue])];
}

// Use for doing Sinh of a number.
- (void)performSinh:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:sinh([myFirstNumber doubleValue])];
}

// Use for doing Cosh of a number.
- (void)perofmrCosh:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:coshf([myFirstNumber doubleValue])];
}

// Use for doing Tanh of a number.
- (void)performtanh:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:tanhf([myFirstNumber doubleValue])];
}

// Use for doing SinInverse of a number.
- (void)performSinInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:asin(number)];
}

// Use for doing CosInverse of a number.
- (void)performCosInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:acos(number)];
}

// Use for doing TanInverse of a number.
- (void)performTaninverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    double number = [self convertionDegreeRadian:myFirstNumber];
    self.result = [NSNumber numberWithDouble:atan(number)];
}

// Use for doing SinhInverse of a number.
- (void)performSinhInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:asinh([myFirstNumber doubleValue])];
}

// Use for doing CoshInverse of a number.
- (void)performCoshInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:acosh([myFirstNumber doubleValue])];
}

// Use for doing TanhInverse of a number.
- (void)performTanhInverse:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:atanh([myFirstNumber doubleValue])];
}

// Use for doing Log base 2 of a number.
- (void)performLogBaseOfTwo:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    self.result = [NSNumber numberWithDouble:log2f([myFirstNumber doubleValue])];

}

// Use for doing Log base Y of a number.
- (void)performLogBaseOfY:(id)dictionary {
    NSNumber *myFirstNumber = [self.formatNumber numberFromString:dictionary[FIRST_NUMBER]];
    NSNumber *mySecondNumber = [self.formatNumber numberFromString:dictionary[SECOND_NUMBER]];
    self.result = [NSNumber numberWithDouble:(log10f([myFirstNumber doubleValue])/log10f([mySecondNumber doubleValue]))];
}

@end
