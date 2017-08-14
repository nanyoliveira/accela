//
//  UserDetailViewController.m
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import "UserDetailViewController.h"

@interface UserDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userCompany;
@property (weak, nonatomic) IBOutlet UILabel *userEmail;
@property (weak, nonatomic) IBOutlet UILabel *userAddress;

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.userName.text = self.user.name;
    self.userCompany.text = [NSString stringWithFormat:@"Company: %@", self.user.company];
    self.userEmail.text = [NSString stringWithFormat:@"Email: %@", self.user.email] ;
    self.userAddress.text = [NSString stringWithFormat:@"Address: %@ Street - %@ \nZIP %@", self.user.street, self.user.city, self.user.zip];
    
}


@end
