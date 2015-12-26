//
//  DatabaseManager.m
//  ChatDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright © 2015 Apeksha Dessai. All rights reserved.
//

#import "DatabaseManager.h"

#define DATABASE_EXTENSION @"sqlite"
#define DATABASE_NAME @"ChatsDb.sqlite"


@interface DatabaseManager ()

@property (nonatomic, retain) FMDatabase *database;

@end

@implementation DatabaseManager

DatabaseManager *databaseManager = nil;


+ (id)sharedDatabaseManager {
    
    @synchronized(self) {
        
        if (databaseManager == nil) {
            databaseManager = [[self alloc] init];
        }
    }
    return databaseManager;
}



- (FMDatabase *)getDatabase {
    
    if(!self.database) {
        
        // Get the documents directory
        NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [directoryPaths objectAtIndex:0];
        
        // Do not copy database if it already exists
        if (![[NSFileManager defaultManager] fileExistsAtPath:[documentsDirectory stringByAppendingPathComponent:DATABASE_NAME]]) {
            
            //copy file from main bundle
            [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"ChatsDb" ofType:@".sqlite"]
                                                    toPath:[documentsDirectory stringByAppendingPathComponent:DATABASE_NAME]
                                                     error:nil];
        }
        
        NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME] ;
        
        //Create and open database
        self.database= [FMDatabase databaseWithPath:dbPath];
        [self.database open];
        
    }
    
    return self.database;
    
}


- (void)closeDatabase {
    
    if (self.database) {
        [self.database close];
    }
}


@end
