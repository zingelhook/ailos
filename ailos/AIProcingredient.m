//
//  AIProcingredients.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProcingredient.h"

@implementation AIProcingredient

- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_name = [JSON objectForKey:@"name"];
		_value = [JSON objectForKey:@"value"];
		_ingredientid = [JSON objectForKey:@"ingredientid"];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"name": @"name",
			   @"value": @"value",
			   @"propertyType": @"ingredientid"
	};
}

@end
