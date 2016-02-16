//
//  AdvancePanelViewController.h
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GetAdvancePanelCharacter)(NSString *character, NSString *identifier);
@interface AdvancePanelViewController : UIViewController
@property(strong, nonatomic) GetAdvancePanelCharacter getAdvancePanelCharacter;
@end
