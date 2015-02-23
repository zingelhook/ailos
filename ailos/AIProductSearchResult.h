//
//  AIProductSearchResult.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIProduct.h"
#import <Mantle/Mantle.h>

@interface AIProductSearchResult :  MTLModel <MTLJSONSerializing>
@property (nonatomic,strong) NSArray *products;
@end
