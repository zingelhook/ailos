//
//  AIMySort.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIMySort.h"

@implementation AIMySort

- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_sortOrder = [JSON objectForKey:@"sort_order"];
		_sortVariable = [JSON objectForKey:@"sort_variable"];
		_varibleType = [JSON objectForKey:@"varible_type"];
	}
	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			   @"sortOrder": @"sort_order",
			   @"sortVariable": @"sort_variable",
			   @"varibleType": @"varible_type"
	};
}

@end
