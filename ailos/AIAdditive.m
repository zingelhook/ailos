//
//  AIAdditive.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIAdditive.h"

@implementation AIAdditive

- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_additiveName = [JSON objectForKey:@"additive_name"];
		_additiveValue = [JSON objectForKey:@"additive_value"];
		_additiveRedIngredients = [JSON objectForKey:@"additive_red_ingredients"];
		_additiveYellowIngredients = [JSON objectForKey:@"additive_yellow_ingredients"];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"additiveName": @"additive_name",
			   @"additiveValue": @"additive_value",
			   @"additiveRedIngredients": @"additive_red_ingredients",
			   @"additiveYellowIngredients": @"additive_yellow_ingredients"
	};
}

@end
