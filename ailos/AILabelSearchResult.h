//
//  AILabelSearchResult.h
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface AILabelSearchResult : MTLModel <MTLJSONSerializing>
@property (strong, nonatomic) NSString *upc;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSArray *allergens;
@property (strong, nonatomic) NSArray *additives;
//@property (assign, nonatomic) BOOL canStoreName;
@end
