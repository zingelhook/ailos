//
//  AIAllergenAdditve.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AIAllergenAdditve :  MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSString *property;
@property (nonatomic, strong) NSString *propertyType;

@property (nonatomic, strong) NSArray *redIngredients;
@property (nonatomic, strong) NSArray *yellowIngredients;

- (id)initWithJSON:(id)JSON;
@end
