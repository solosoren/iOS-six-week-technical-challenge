//
//  ViewController.h
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerController.h"

@interface OriginalViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *shuffledArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) Player *player;


@end

