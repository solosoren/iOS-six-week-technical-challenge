//
//  PlayerController.h
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Stack.h"

@interface PlayerController : NSObject

@property (strong, nonatomic) NSMutableArray *players;

+ (PlayerController *)sharedInstance;

- (Player *)createPlayer;

- (void)removePlayer:(Player *)player;

- (void)save;

@end
