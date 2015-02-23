//
//  AIMyIngredient.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AIMyIngredient :  MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ingredientId;
@property (nonatomic, strong) NSString *sameas;
@property (assign, nonatomic) BOOL value;
- (id)initWithJSON:(id)JSON;
@end
