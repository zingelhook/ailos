//
//  AIProduct.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProduct.h"

@implementation AIProduct

- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		self.upc = [JSON objectForKey:@"upc"];
		self.isInMyList = [[JSON objectForKey:@"isInMyList"] boolValue];
		self.productName = [JSON objectForKey:@"product_name"];
		self.productDescription = [JSON objectForKey:@"product_description"];
		self.brand = [JSON objectForKey:@"brand"];
		self.manufacturer = [JSON objectForKey:@"manufacturer"];
		self.productSize = [JSON objectForKey:@"product_size"];
	}
	return self;
}

@end
