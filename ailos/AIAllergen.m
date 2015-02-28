//
//  AIAllergen.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIAllergen.h"

@implementation AIAllergen
- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_name = [JSON objectForKey:@"allergen_name"];
		_value = [JSON objectForKey:@"allergen_value"];
		_allergenRedIngredients = [JSON objectForKey:@"allergen_red_ingredients"];
		_allergenYellowIngredients = [JSON objectForKey:@"allergen_yellow_ingredients"];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"name": @"allergen_name",
			   @"value": @"allergen_value",
			   @"allergenRedIngredients": @"allergen_red_ingredients",
			   @"allergenYellowIngredients": @"allergen_yellow_ingredients"
	};
}

@end
