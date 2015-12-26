//
//  ViewController.m
//  ChatsDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright (c) 2015 Apeksha Dessai. All rights reserved.
//

#import "ViewController.h"
#import "Chat.h"
#import "ChatDataCell.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray  *chats;
@property (strong, nonatomic) IBOutlet UITableView *chatsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Insert Dummy data
    Chat *chat = [Chat new];
    chat.name = @"Obi-Wan Kenobi";
    chat.chatDescription = @"C5	May the force be with you";
    chat.onlineStatus = false;
    chat.updatedDate = [NSDate date ];
    chat.photo = @"list1Photo";
    chat.chatId = 4;
//    [chat insert];
    
    self.chats = [NSArray arrayWithArray:[Chat allChats]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.chats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    ChatDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
    
    Chat *chat = [self.chats objectAtIndex:indexPath.row];
    
    [cell.photoImageView setImage:[UIImage imageNamed:chat.photo]];
    cell.nameLabel.text = chat.name;
    cell.descriptionLabel.text = chat.chatDescription;
    cell.counterLabel.text = [NSString stringWithFormat:@"%d", chat.counter];
    
    return cell;
}


@end
