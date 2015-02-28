//
//  AILabelSearchResult.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelSearchResult.h"
#import "AIAllergen.h"
#import "AIAdditive.h"

@implementation AILabelSearchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"upc": @"upc",
			   @"productName": @"product_name",
			   @"allergens": @"allergens",
               @"additives": @"additives"
	};
}

+ (NSValueTransformer *)allergensJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AIAllergen.class];
}

+ (NSValueTransformer *)additivesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AIAdditive.class];
}

@end
