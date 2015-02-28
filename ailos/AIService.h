//
//  ALService.h
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AISession.h"
#import "AIProfile.h"
#import "AIProductSearchResult.h"
#import "AIAllergenAdditve.h"
#import "AILabelSearchResult.h"

@interface AIService : NSObject
typedef void (^SessionSuccess)(AISession *);
typedef void (^SessionFailure)(NSError *);

typedef void (^GetProfileSuccess)(AIProfile *);
typedef void (^GetProfileFailure)(NSError *);

typedef void (^PostSuccess)(BOOL);
typedef void (^PostFailure)(NSError *);

typedef void (^SearchProductsSuccess)(AIProductSearchResult *);
typedef void (^SearchProductsFailure)(NSError *);

typedef void (^GetAllergenAdditiveSuccess)(AIAllergenAdditve *);
typedef void (^GetAllergenAdditiveFailure)(NSError *);

typedef void (^GetLabelSuccess)(AILabelSearchResult *);
typedef void (^GetLabelFailure)(NSError *);


- (void)createSession:(SessionSuccess)success failure:(SessionFailure)failure;
- (void)getProfile:(GetProfileSuccess)success failure:(GetProfileFailure)failure session:(AISession *)session;
- (void)searchProducts:(SearchProductsSuccess)success failure:(SearchProductsFailure)failure session:(AISession *)session searchTerm:(NSString *)searchTerm;
- (void)getAllergenAdditive:(GetAllergenAdditiveSuccess)success failure:(GetAllergenAdditiveFailure)failure sessionId:(NSString *)sessionId upc:(NSString *)upc property:(NSString *)property propertyType:(NSString *)propertyType;
- (void)setProfile:(GetProfileSuccess)success failure:(GetProfileFailure)failure json:(AIProfile *)json;
- (void)addMyIngredient:(PostSuccess)success failure:(PostFailure)failure ingredientID:(NSString *)ingredientID ingredientString:(NSString *)ingredientString;
- (void)ingredientSearch:(SearchProductsSuccess)success failure:(SearchProductsFailure)failure session:(AISession *)session searchTerm:(NSString *)searchTerm;
- (void)getLabel:(GetLabelSuccess)success failure:(GetLabelFailure)failure session:(AISession *)session upc:(NSString *)upc;
@end
