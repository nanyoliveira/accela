//
//  UsersTableViewCell.h
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UsersTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (nonatomic) User * user;

-(void)setData:(NSDictionary*)dictionaryData;

@end
