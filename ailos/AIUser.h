//
//  AIUser.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AIUser :  MTLModel <MTLJSONSerializing>
@property (nonatomic, strong)NSString *uId;
@end
