//
//  AIProcingredients.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIProcingredient : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *ingredientid;
- (id)initWithJSON:(id)JSON;
@end
