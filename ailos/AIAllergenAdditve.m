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
		self.upc = [JSON objectForKey:@"upc"];
		self.property = [JSON objectForKey:@"property"];
		self.propertyType = [JSON objectForKey:@"propType"];


		NSMutableArray *redIngredients = [[NSMutableArray alloc]init];
		for (NSArray *nutrientJSON in JSON[@"redIngredients"]) {
			[redIngredients addObject:nutrientJSON];
		}

		self.redIngredients = [redIngredients copy];

		NSMutableArray *yellowIngredients = [[NSMutableArray alloc]init];
		for (NSArray *nutrientJSON in JSON[@"yellowIngredients"]) {
			[yellowIngredients addObject:nutrientJSON];
		}

		self.yellowIngredients = [yellowIngredients copy];
	}
	return self;
}

@end
