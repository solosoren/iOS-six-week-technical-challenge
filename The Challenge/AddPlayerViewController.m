//
//  AddPlayerViewController.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "AddPlayerViewController.h"
#import "PlayerController.h"

@interface AddPlayerViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *player1TextField;

@end

@implementation AddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateWithPlayer:self.player];
}

#pragma mark - TextField DELEGATE
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addPlayerButtonTapped:(id)sender {
    
    // If editing current player
    if (self.player) {
        self.player.player1Name = self.player1TextField.text;
    } else {
        // Create new player
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

@end
