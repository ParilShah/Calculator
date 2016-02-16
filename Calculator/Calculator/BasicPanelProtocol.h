//
//  BasicPanelProtocol.h
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BasicPanelProtocol <NSObject>
- (void)sendBasicPanelCalculation:(NSString *)character withIdentifier:(NSString *)identifier;
@end
