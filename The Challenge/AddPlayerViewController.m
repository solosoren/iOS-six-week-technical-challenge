//
//  AddPlayerViewController.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "AddPlayerViewController.h"
#import "PlayerController.h"

@interface AddPlayerViewController ()
@property (strong, nonatomic) IBOutlet UITextField *player1TextField;

@end

@implementation AddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateWithPlayer:self.player];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)addPlayerButtonTapped:(id)sender {
    
    if (self.player) {
        self.player.player1Name = self.player1TextField.text;
    } else {
        self.player = [[PlayerController sharedInstance] createPlayer];
        self.player.player1Name = self.player1TextField.text;

    }
    [[PlayerController sharedInstance] save];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)updateWithPlayer:(Player *)newPlayer {
    
    if (newPlayer) {
        self.player1TextField.text = newPlayer.player1Name;
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
