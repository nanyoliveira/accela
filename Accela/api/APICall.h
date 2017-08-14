//
//  APICall.h
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIDelegate <NSObject>

-(void)receiveData:(NSArray*)data;
-(void)receiveError:(NSError*)error;

@end





@interface APICall : NSObject

@property(nonatomic) id <APIDelegate> delegate;


-(void) callAPI:(int)start from:(int)until;



@end
