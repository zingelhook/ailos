//
//  AIAdditive.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AIAdditive :  MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *additiveName;
@property (nonatomic, strong) NSString *additiveValue;
@property (nonatomic, strong) NSString *additiveRedIngredients;
@property (nonatomic, strong) NSString *additiveYellowIngredients;
- (id)initWithJSON:(id)JSON;
@end
