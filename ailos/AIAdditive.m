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
		self.additiveName = [JSON objectForKey:@"additive_name"];
		self.additiveValue = [JSON objectForKey:@"additive_value"];
		self.additiveRedIngredients = [JSON objectForKey:@"additive_red_ingredients"];
		self.additiveYellowIngredients = [JSON objectForKey:@"additive_yellow_ingredients"];
	}
	return self;
}

@end
