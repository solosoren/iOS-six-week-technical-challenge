//
//  AddPlayerViewController.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "AddPlayerViewController.h"

@interface AddPlayerViewController ()
@property (strong, nonatomic) IBOutlet UITextField *player1;
@property (strong, nonatomic) IBOutlet UITextField *Player2;

@end

@implementation AddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateWithPlayer:(Player *)newPlayer {
    if (newPlayer) {
        self.player1.text = newPlayer.player1Name;
        self.Player2.text = newPlayer.player2Name;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
