//
//  ChatDataCell.h
//  ChatsDemo
//
//  Created by Apeksha Dessai on 26/12/15.
//  Copyright (c) 2015 Apeksha Dessai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatDataCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
