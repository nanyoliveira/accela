//
//  User.h
//  Accela
//
//  Created by Matt Ariane Clarke on 14/08/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject



@property (nonatomic) NSString * name ;
@property (nonatomic) NSString * email ;
@property (nonatomic) NSString * street ;
@property (nonatomic) NSString * city ;
@property (nonatomic) NSString * zip ;
@property (nonatomic) NSString * company ;


-(void)createFromJson:(NSDictionary *) jsonDictionary;


@end
