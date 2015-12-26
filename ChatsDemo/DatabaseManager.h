//
//  DatabaseManager.h
//  ChatDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright © 2015 Apeksha Dessai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DatabaseManager : NSObject

+ (id)sharedDatabaseManager;
- (FMDatabase *)getDatabase;
- (void)closeDatabase;

@end
