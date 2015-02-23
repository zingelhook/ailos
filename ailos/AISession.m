//
//  ALSession.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AISession.h"
static AISession *instance = nil;
@implementation AISession

- (id)initUser:(AIUser *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

- (void)updateWithJSON:(id)JSON {
	_sessionId = [JSON objectForKey:@"session_id"];
	_deviceId = [JSON objectForKey:@"device_id"];
	_appId = [JSON objectForKey:@"app_id"];
	_validUser = [[JSON objectForKey:@"validUser"] boolValue];
	_version = [JSON objectForKey:@"version"];
    _userId = [JSON objectForKey:@"user_id"];
}

+ (AISession *)getInstance {
    @synchronized(self)
    {
        if (instance == nil) {
            instance = [AISession new];
        }
    }
    return instance;
}


@end
