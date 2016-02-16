//
//  BasicPanelViewController.h
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GetBasicPanelCharacter)(NSString *character, NSString *identifier);
@interface BasicPanelViewController : UIViewController
@property(strong, nonatomic) GetBasicPanelCharacter getBasicPanelCharacter;
@end
