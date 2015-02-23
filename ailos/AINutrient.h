//
//  AINutrient.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AINutrient :  MTLModel <MTLJSONSerializing>
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL value;
- (id)initWithJSON:(id)JSON;
@end
