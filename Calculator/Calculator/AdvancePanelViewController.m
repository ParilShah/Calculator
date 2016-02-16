//
//  AdvancePanelViewController.m
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class manage AdvancePanelView.

#import "AdvancePanelViewController.h"
#import "AdvancePanelView.h"

@interface AdvancePanelViewController ()<BasicPanelProtocol>
@property(weak, nonatomic) IBOutlet AdvancePanelView *advancePanelView;
@end

@implementation AdvancePanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.advancePanelView setBasicPanelDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma BasicPanelProtocol

- (void)sendBasicPanelCalculation:(NSString *)character withIdentifier:(NSString *)identifier{
    if (self.getAdvancePanelCharacter) {
        self.getAdvancePanelCharacter(character, identifier);
    }
}

@end
