//
//  UsersTableViewCell.m
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import "UsersTableViewCell.h"

@implementation UsersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setData:(NSDictionary*)dictionaryData {
    self.user = [[User alloc] init];
    [self.user createFromJson:dictionaryData];

    if (self.user != nil)
    {
        self.userName.text = self.user.name ;
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
