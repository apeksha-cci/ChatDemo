//
//  Chat.m
//  ChatDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright © 2015 Apeksha Dessai. All rights reserved.
//

#import "Chat.h"
#import "DatabaseManager.h"

@implementation Chat

- (BOOL)insert {
    
    BOOL success = TRUE;
    
    NSString *insertQuery = @"INSERT INTO Chat (ChatId, Name, Description, OnlineStatus, UpdatedTime, Photo, CounterValue)VALUES(?, ?, ?, ?, ?, ?, ?)";
    
    FMDatabase *database = [[DatabaseManager sharedDatabaseManager] getDatabase];
    
    [database beginTransaction];
    
    if(![database executeUpdate:insertQuery,
         @(self.chatId),
         self.name,
         self.chatDescription,
         [NSNumber numberWithBool:self.onlineStatus],
         self.updatedDate,
         self.photo,
         @(self.counter)]) {
        
        success = FALSE;
    }
    
    [database commit];
    
    if(database.hadError){
        success = FALSE;
    }
    
    return success;
    
}

+ (NSArray *)allChats {
    
    NSMutableArray *chatsArray =[NSMutableArray new];
    
    FMResultSet * resultSet  = [[[DatabaseManager sharedDatabaseManager]getDatabase]
                                executeQuery:@"SELECT * FROM Chat"];
    
    while ([resultSet next]) {
        
        Chat *chat = [Chat new];
        chat.chatId = [resultSet intForColumn:@"ChatId"];
        chat.name = [resultSet stringForColumn:@"Name"];
        chat.chatDescription = [resultSet stringForColumn:@"Description"];
        chat.onlineStatus = [resultSet boolForColumn:@"OnlineStatus"];
        chat.photo = [resultSet stringForColumn:@"Photo"];
        chat.updatedDate = [resultSet dateForColumn:@"UpdatedTime"];
        chat.counter = [resultSet intForColumn:@"CounterValue"];
        
        [chatsArray addObject:chat];
    }
    
    return chatsArray;
}


@end
