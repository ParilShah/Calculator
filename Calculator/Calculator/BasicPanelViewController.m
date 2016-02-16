//
//  BasicPanelViewController.m
//  Calculator
//
//  Created by Paril Shah on 2/8/16.
//  Copyright © 2016 Paril Shah. All rights reserved.
//  Description : This class manage BasicPanelView.

#import "BasicPanelViewController.h"
#import "BasicPanelView.h"

@interface BasicPanelViewController () <BasicPanelProtocol>
@property(weak, nonatomic) IBOutlet BasicPanelView *basicPanelView;
@end

@implementation BasicPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.basicPanelView setBasicPanelDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma BasicPanelProtocol

- (void)sendBasicPanelCalculation:(NSString *)character withIdentifier:(NSString *)identifier{
    if (self.getBasicPanelCharacter) {
        self.getBasicPanelCharacter(character, identifier);
    }
}
@end
