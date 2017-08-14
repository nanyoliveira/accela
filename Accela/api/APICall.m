//
//  APICall.m
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import "APICall.h"
#import <AFNetworking.h>


@implementation APICall



-(void) callAPI:(int)start from:(int)until
{
    NSString * path = @"https://jsonplaceholder.typicode.com/users";
    
    
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //https://jsonplaceholder.typicode.com/users?_start=0&_limit=2
    
    
    
    
    NSString * stringURL = [NSString stringWithFormat:@"%@?_start=%d&_limit=%d", path, start, until];
    NSURL *URL = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL] ;
    
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            [_delegate receiveError:error];
        }
        else{
            
            if ([responseObject isKindOfClass:[NSArray class]])
            {
                [ _delegate receiveData:(NSArray*) responseObject];
            }
            
        }
    }];
    [dataTask resume];
    
}





@end
