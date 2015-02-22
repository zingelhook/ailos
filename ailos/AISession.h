//
//  ALSession.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIUser.h"

@interface AISession : NSObject
@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *deviceId;
@property (nonatomic, assign) BOOL validUser;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *retailerId;
@property (nonatomic, strong) AIUser *user;
- (id)initUser:(AIUser *)user;
- (void)updateWithJSON:(id)JSON;
+ (AISession *)getInstance;
@end
