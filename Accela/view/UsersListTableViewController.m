//
//  UsersListTableViewController.m
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import "UsersListTableViewController.h"
#import "APICall.h"
#import "UsersTableViewCell.h"
#import "UserDetailViewController.h"

@interface UsersListTableViewController ()

@property(nonatomic) APICall * api;

@property(nonatomic) NSArray * usersData;


@end

@implementation UsersListTableViewController



static int loadAvailable = 20;
- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.api = [[APICall alloc]init];
    self.api.delegate = self;

    [self.api callAPI:0 from:loadAvailable];
    
}

#pragma mark - API


-(void)receiveData:(NSArray*)data{
    self.usersData = data;
    [self.tableView reloadData];
}



-(void)receiveError:(NSError*)error{
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"ops..." message:@"something wrong with the API" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        //alert dismis
    }];
    
    
    [alert addAction:dismiss];

    [self presentViewController:alert animated:YES completion:nil];

}



#pragma mark - Scrolls


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    loadAvailable ++;
    
    
    [self.api callAPI:0 from:loadAvailable];
    
    if([self.usersData count]> 0)
    {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.usersData count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.usersData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    if([self.usersData[indexPath.row] isKindOfClass:[NSDictionary class]])
    {
        [cell setData: (NSDictionary*)self.usersData[indexPath.row] ];
    }
    
 
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"userDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"userDetail"])
    {
        if ([[segue destinationViewController] isKindOfClass: [UserDetailViewController class] ])
        {
            UserDetailViewController * userDetail = [segue destinationViewController];
            NSIndexPath * index = [self.tableView indexPathForSelectedRow];
            UsersTableViewCell * cell = [self.tableView cellForRowAtIndexPath:index ];
            
            userDetail.user = cell.user;
        }
       
    }

}


@end
