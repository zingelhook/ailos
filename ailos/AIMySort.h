//
//  AIMySort.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@interface AIMySort : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *sortVariable;
@property (nonatomic, strong) NSString *sortOrder;
@property (nonatomic, strong) NSString *varibleType;

- (id)initWithJSON:(id)JSON;
@end
