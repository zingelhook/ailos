//
//  AIProfile.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIMySort.h"
#import <Mantle/Mantle.h>

@interface AIProfile :  MTLModel <MTLJSONSerializing>
@property (strong, nonatomic) NSArray *allergens;
@property (strong, nonatomic) NSArray *nutrients;
@property (strong, nonatomic) NSArray *additives;
@property (strong, nonatomic) NSArray *myIngredients;
@property (strong, nonatomic) AIMySort *mySort;
@property (strong, nonatomic) NSString *sessionId;
- (id)initWithJSON:(id)JSON;
@end
