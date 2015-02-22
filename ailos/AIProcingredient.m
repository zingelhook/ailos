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
		self.name = [JSON objectForKey:@"name"];
		self.value = [JSON objectForKey:@"value"];
		self.ingredientid = [JSON objectForKey:@"ingredientid"];
	}
	return self;
}

@end
