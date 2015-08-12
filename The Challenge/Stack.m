//
//  Stack.m
//  The Challenge
//
//  Created by Soren Nelson on 8/12/15.
//  Copyright (c) 2015 SCN. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation Stack

+ (Stack *)sharedInstance {
    static Stack *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Stack new];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setupManagedObjectContext];
    }
    return self;
}

- (void)setupManagedObjectContext {
    self.managedObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}

- (NSURL*)storeURL {
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                       inDomain:NSUserDomainMask
                                                              appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}

- (NSManagedObjectModel *)managedObjectModel {
    
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];

}

@end