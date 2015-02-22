//
//  AIProduct.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIProduct : NSObject
@property (strong, nonatomic) NSString *upc;
@property (assign, nonatomic) BOOL isInMyList;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *manufacturer;
@property (strong, nonatomic) NSString *productSize;
- (id)initWithJSON:(id)JSON;

@end
