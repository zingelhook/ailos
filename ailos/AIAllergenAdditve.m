//
//  AIAllergenAdditve.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIAllergenAdditve.h"

@implementation AIAllergenAdditve

- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_upc = [JSON objectForKey:@"upc"];
		_property = [JSON objectForKey:@"property"];
		_propertyType = [JSON objectForKey:@"propType"];


		NSMutableArray *redIngredients = [[NSMutableArray alloc]init];
		for (NSArray *nutrientJSON in JSON[@"redIngredients"]) {
			[redIngredients addObject:nutrientJSON];
		}

		_redIngredients = [redIngredients copy];

		NSMutableArray *yellowIngredients = [[NSMutableArray alloc]init];
		for (NSArray *nutrientJSON in JSON[@"yellowIngredients"]) {
			[yellowIngredients addObject:nutrientJSON];
		}

		_yellowIngredients = [yellowIngredients copy];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"upc": @"upc",
			   @"property": @"property",
			   @"propertyType": @"propType",
               @"redIngredients": @"redIngredients",
               @"yellowIngredients": @"yellowIngredients"
	};
}



@end
