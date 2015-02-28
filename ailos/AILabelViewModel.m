//
//  AILabelViewModel.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelViewModel.h"
#import "AIAllergen.h"
@implementation AILabelViewModel

- (id)initWithAILabelSearchResult:(AILabelSearchResult *)result {
	self = [super init];

	NSMutableArray *mAllergen = [[NSMutableArray alloc]init];
	if (self) {
		for (AIAllergen *allergen in result.allergens) {
			if ([allergen.value integerValue] > 0) {
				[mAllergen addObject:allergen];
			}
		}

		_allergens = [mAllergen copy];
	}

	return self;
}

@end
