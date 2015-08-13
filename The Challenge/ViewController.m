//
//  ViewController.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "ViewController.h"
#import "AddPlayerViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomizeButtonTapped:(id)sender {
    
    self.shuffledArray = [PlayerController sharedInstance].players.mutableCopy;
    
    NSUInteger count = [PlayerController sharedInstance].players.count;
    
    for (NSUInteger i = 0; i < count; ++i) {
        
        NSInteger remainingCount = count - i;
        
        NSInteger newIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        
        [self.shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
    }
    
    NSLog(@"%@", [PlayerController sharedInstance].players);
    
    NSLog(@"%@", self.shuffledArray);
    
    [self.tableView reloadData];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editPlayer"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        AddPlayerViewController *viewController = segue.destinationViewController;
        
        NSInteger kPlayerIndex = indexPath.section * 2 + indexPath.row;

        Player *player = [PlayerController sharedInstance].players[kPlayerIndex];
        
        viewController.player = player;
    }
}

#pragma mark - TableViewDataSourceMethods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger playerIndex = indexPath.section * 2 + indexPath.row;
    
    Player *player = [PlayerController sharedInstance].players[playerIndex];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCellID"];
    
    cell.textLabel.text = player.player1Name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[PlayerController sharedInstance] removePlayer:[PlayerController sharedInstance].players[indexPath.row]];
        
        [[PlayerController sharedInstance]save];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    NSInteger playerCount = [PlayerController sharedInstance].players.count / 2;
    
    return playerCount;

//    if (playerCount % 2 == 1) {
//        return (playerCount / 2) + 1;
//    } else {
//        return playerCount / 2;
//    }
    
   
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@"Team %ld",(long)section + 1];
}





//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    UIView *headerView = [
//    UILabel *label = (UILabel *)[headerView viewWithTag:123];
//    [label setText:@"title"];
//    
//    return headerView;
//    
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
////        return 48.0;
//    
//}


@end
