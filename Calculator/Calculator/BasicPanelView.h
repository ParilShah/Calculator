//
//  BasicPanelView.h
//  Calculator
//
//  Created by Paril Shah on 2/6/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPanelProtocol.h"

@interface BasicPanelView : UIView
@property(assign, nonatomic) id<BasicPanelProtocol> basicPanelDelegate;
@end
