//
//  AINutrient.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AINutrient.h"

@implementation AINutrient
- (id)initWithJSON:(id)JSON {
	self = [super init];

	if (self) {
		_name = [JSON objectForKey:@"name"];
		self.value = [[JSON objectForKey:@"value"] boolValue];
	}
	return self;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"value": @"value"
             };
}

@end
