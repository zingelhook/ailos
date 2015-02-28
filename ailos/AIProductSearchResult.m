//
//  AIProductSearchResult.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProductSearchResult.h"
#import "AIProduct.h"
@implementation AIProductSearchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"products": @"productsArray"
	};
}

+ (NSValueTransformer *)productsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AIProduct.class];
}

@end
