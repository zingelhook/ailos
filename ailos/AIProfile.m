//
//  AIProfile.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProfile.h"
#import "AINutrient.h"
#import "AIAllergen.h"
#import "AIAdditive.h"
#import "AIMyIngredient.h"
#import "AIMySort.h"
@implementation AIProfile
- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_mySort = [[AIMySort alloc]initWithJSON:[JSON objectForKey:@"sort_order"]];
		_sessionId = [JSON objectForKey:@"session_id"];

		NSMutableArray *mNutrients = [[NSMutableArray alloc]init];
		for (NSArray *nutrientJSON in JSON[@"nutrients"]) {
			AINutrient *n = [[AINutrient alloc]initWithJSON:nutrientJSON];
			[mNutrients addObject:n];
		}

		_nutrients = [mNutrients copy];

		NSMutableArray *mAllergen = [[NSMutableArray alloc]init];
		for (NSArray *allergenJSON in JSON[@"allergens"]) {
			AIAllergen *a = [[AIAllergen alloc]initWithJSON:allergenJSON];
			[mAllergen addObject:a];
		}

		_allergens = [mAllergen copy];

		NSMutableArray *mAdditives = [[NSMutableArray alloc]init];
		for (NSArray *additiveJSON in JSON[@"additives"]) {
			AIAdditive *a = [[AIAdditive alloc]initWithJSON:additiveJSON];
			[mAdditives addObject:a];
		}

		_additives = [mAdditives copy];

		NSMutableArray *mMyIngredients = [[NSMutableArray alloc]init];
		for (NSArray *myIngredientJSON in JSON[@"myingredients"]) {
			AIMyIngredient *a = [[AIMyIngredient alloc]initWithJSON:myIngredientJSON];
			[mMyIngredients addObject:a];
		}

		_myIngredients = [mMyIngredients copy];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"mySort": @"sort_order",
			   @"sessionId": @"session_id",
			   @"nutrients": @"nutrients",
			   @"allergens": @"allergens",
			   @"additives": @"additives",
			   @"myIngredients": @"myingredients"
	};
}

+ (NSValueTransformer *)mySortJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:AIMySort.class];
}

+ (NSValueTransformer *)nutrientsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AINutrient.class];
}

+ (NSValueTransformer *)myIngredientsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AIAllergen.class];
}

+ (NSValueTransformer *)additivesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:AIMyIngredient.class];
}

@end
