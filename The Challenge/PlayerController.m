//
//  PlayerController.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "PlayerController.h"

@interface PlayerController ()

@property (strong, nonatomic) NSArray *players;

@end

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlayerController new];
    });
    
    return sharedInstance;
}

#pragma mark - Create

- (Player *) createPlayer {
    
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    return player;
}

#pragma mark - Retrieve

- (NSArray *)Players {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    
    NSError *error;
    
    NSArray *EveryPlayer = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Error %@", error.localizedDescription);
    }
    return EveryPlayer;
}

#pragma mark - Update

- (void)save {
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Delete

- (void)removePlayer:(Player *)player {
    
    [player.managedObjectContext deleteObject:player];
}

@end
