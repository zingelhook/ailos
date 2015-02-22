//
//  AIProfile.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIProfile : NSObject
@property (strong, nonatomic) NSArray *allergens;
@property (strong, nonatomic) NSArray *nutrients;
- (id)initWithJSON:(id)JSON;
@end
