//
//  AddressCard.h
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject <NSCoding>

@property (nonatomic, retain) NSMutableArray *hobbies;
@property (nonatomic, retain) NSMutableArray *friends;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *street;
@property (nonatomic, retain) NSNumber *streetNumber;
@property (nonatomic, retain) NSNumber *postalCode;
@property (nonatomic, retain) NSString *location;




- (void)addHobby:(NSString *)hobby;
- (void)removeHobby:(NSString *)hobby;
- (void)addFriend:(AddressCard *)friend;
- (void)removeFriend:(AddressCard *)friend;

@end
