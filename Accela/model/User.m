//
//  User.m
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import "User.h"

@implementation User

-(void)createFromJson:(NSDictionary *) jsonDictionary {
    
    
    if([jsonDictionary objectForKey:@"name"])
    {
        self.name = jsonDictionary[@"name"];
    }
    
    if([jsonDictionary objectForKey:@"email"])
    {
        self.email = jsonDictionary[@"email"];
    }
    
    if([jsonDictionary objectForKey:@"company"])
    {
        NSDictionary* jcompany = jsonDictionary[@"company"];
        if([jcompany objectForKey:@"name"]) {
            self.company = jcompany[@"name"];
        }
    }
    
    
    
    if([jsonDictionary objectForKey:@"address"])
    {
        NSDictionary* address = jsonDictionary[@"address"];
        if([address objectForKey:@"street"]) {
            self.street = address[@"street"];
        }
        
        
        if([address objectForKey:@"city"]) {
            self.city = address[@"city"];
        }
        
        
        if([address objectForKey:@"zipcode"]) {
            self.zip = address[@"zipcode"];
        }
    }
    
}

@end
