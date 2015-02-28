//
//  AIAllergen.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AIAllergen :  MTLModel <MTLJSONSerializing>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *value;
@property (nonatomic, strong) NSString *allergenRedIngredients;
@property (nonatomic, strong) NSString *allergenYellowIngredients;

- (id)initWithJSON:(id)JSON;
@end
