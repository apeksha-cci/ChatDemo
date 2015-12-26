//
//  Chat.h
//  ChatDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright © 2015 Apeksha Dessai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chat : NSObject

@property (readwrite, nonatomic) int  chatId;

@property (strong, nonatomic) NSString  *name;

@property (strong, nonatomic) NSString  *chatDescription;

@property (strong, nonatomic) NSDate  *updatedDate;

@property (strong, nonatomic) NSString  *photo;

@property (readwrite, nonatomic) int  counter;

@property (readwrite, nonatomic) BOOL onlineStatus;


- (BOOL)insert;
+ (NSArray *)allChats;

@end
