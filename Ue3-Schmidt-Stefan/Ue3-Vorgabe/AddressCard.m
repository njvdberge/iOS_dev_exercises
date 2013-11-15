//
//  AddressCard.m
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard
@synthesize hobbies = _hobbies;
@synthesize friends = _friends;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize street = _street;
@synthesize streetNumber = _streetNumber;
@synthesize postalCode = _postalCode;
@synthesize location = _location;

- (void)addHobby:(NSString *)hobby
{
    [self.hobbies addObject:hobby];
}

- (void)removeHobby:(NSString *)hobby
{
    [self.hobbies removeObject:hobby];
}

- (void)addFriend:(AddressCard *)friend
{
    [self.friends addObject:friend];
}

- (void)removeFriend:(AddressCard *)friend
{
    [self.friends removeObjectIdenticalTo:friend];
}

- (NSMutableArray *)hobbies
{
    if (!_hobbies)
    {
        _hobbies = [[NSMutableArray alloc] init];
    }
    return _hobbies;
}

- (NSMutableArray *)friends
{
    if (!_friends)
    {
        _friends = [[NSMutableArray alloc ]init];
    }
    return _friends;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.street forKey:@"street"];
    [encoder encodeObject:self.streetNumber forKey:@"streetNumber"];
    [encoder encodeObject:self.postalCode forKey:@"postalCode"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.hobbies forKey:@"hobbies"];
    [encoder encodeObject:self.friends forKey:@"friends"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        self.firstName = [decoder decodeObjectForKey:@"firstName"];
        self.lastName = [decoder decodeObjectForKey:@"lastName"];
        self.street= [decoder decodeObjectForKey:@"street"];
        self.streetNumber = [decoder decodeObjectForKey:@"streetNumber"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.postalCode = [decoder decodeObjectForKey:@"postalCode"];
        self.hobbies = [decoder decodeObjectForKey:@"hobbies"];
        self.friends = [decoder decodeObjectForKey:@"friends"];
    }
    return self;
    
}



- (void) dealloc
{
    [_hobbies dealloc];
    [_friends dealloc];
    [super dealloc];
}
@end
