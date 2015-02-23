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
		_upc = [JSON objectForKey:@"upc"];
		_isInMyList = [[JSON objectForKey:@"isInMyList"] boolValue];
		_productName = [JSON objectForKey:@"product_name"];
		_productDescription = [JSON objectForKey:@"product_description"];
		_brand = [JSON objectForKey:@"brand"];
		_manufacturer = [JSON objectForKey:@"manufacturer"];
		_productSize = [JSON objectForKey:@"product_size"];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"upc": @"upc",
			   @"isInMyList": @"isInMyList",
			   @"productName": @"product_name",
			   @"productDescription": @"product_description",
			   @"brand": @"brand",
               @"manufacturer": @"manufacturer",
               @"productSize": @"product_size"
	};
}

@end
