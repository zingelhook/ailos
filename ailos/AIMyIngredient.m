//
//  AIMyIngredient.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIMyIngredient.h"

@implementation AIMyIngredient


- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_name = [JSON objectForKey:@"name"];
		_ingredientId = [JSON objectForKey:@"ingredientid"];
		_sameas = [JSON objectForKey:@"sameas"];
		_value = [[JSON objectForKey:@"value"] boolValue];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"name": @"name",
			   @"ingredientId": @"ingredientid",
			   @"profile": @"profile"
	};
}

@end
