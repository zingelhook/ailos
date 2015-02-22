//
//  ALService.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIService.h"
#import "AISession.h"
#import "AIProductSearchResult.h"


#define BASE_URL @"http://api.foodessentials.com/"
#define API_KEY @"t9d9vybqyahqvhaegvz26cwt"
@interface AIService ()
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

@end

@implementation AIService

- (AFHTTPRequestOperationManager *)manager {
	if (!_manager) {
		_manager = [[AFHTTPRequestOperationManager alloc] init];
		_manager.requestSerializer = [AFJSONRequestSerializer serializer];
	}
	return _manager;
}

- (void)createSession:(SessionSuccess)success failure:(SessionFailure)failure {
	NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"createsession"];
	AIUser *user = [[AIUser alloc]init];
	NSMutableString *mutableURL = [[NSMutableString alloc]init];
	[mutableURL appendString:url];
	[mutableURL appendString:[NSString stringWithFormat:@"?uid=%@",  user.uId]];
	[mutableURL appendString:[NSString stringWithFormat:@"&app_id=%@",  @"ert"]];
	[mutableURL appendString:[NSString stringWithFormat:@"&devid=%@", [[UIDevice currentDevice] identifierForVendor].UUIDString]];
	[mutableURL appendString:[NSString stringWithFormat:@"&api_key=%@", API_KEY]];
	[mutableURL appendString:[NSString stringWithFormat:@"&f=%@", @"json"]];
	[mutableURL appendString:[NSString stringWithFormat:@"&v=%@", @"2.0"]];

	[self.manager GET:mutableURL parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
       	AISession *session = [AISession getInstance];
        session.user = user;
	   // AISession *session = [[AISession alloc]initUser:user];
	    [session updateWithJSON:responseObject];
	    if (success) success(session);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

- (void)getProfile:(GetProfileSuccess)success failure:(GetProfileFailure)failure session:(AISession *)session {
	NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"getprofile"];
	NSMutableString *mutableURL = [[NSMutableString alloc]init];
	[mutableURL appendString:url];
	[mutableURL appendString:[NSString stringWithFormat:@"?sid=%@",  session.sessionId]];
	[mutableURL appendString:[NSString stringWithFormat:@"&f=%@", @"json"]];

	[self.manager GET:mutableURL parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    AIProfile *profile = [[AIProfile alloc]initWithJSON:responseObject];

	    if (success) success(profile);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

- (void)searchProducts:(SearchProductsSuccess)success failure:(SearchProductsFailure)failure session:(AISession *)session searchTerm:(NSString *)searchTerm {
	NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"getprofile"];
	NSMutableString *mutableURL = [[NSMutableString alloc]init];
	[mutableURL appendString:url];
	[mutableURL appendString:[NSString stringWithFormat:@"?sid=%@",  session.sessionId]];
	[mutableURL appendString:[NSString stringWithFormat:@"&f=%@", @"json"]];
	[mutableURL appendString:[NSString stringWithFormat:@"&q=%@", searchTerm]];
	[mutableURL appendString:[NSString stringWithFormat:@"&n=%@", @"10"]];
	[mutableURL appendString:[NSString stringWithFormat:@"&s=%@", @"1"]];
	[mutableURL appendString:[NSString stringWithFormat:@"&v=%@", @"2.0"]];

	[self.manager GET:mutableURL parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    AIProductSearchResult *ps = [[AIProductSearchResult alloc]init];

	    if (success) success(ps);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

/*
 Gives a specific allergen or additive properties of a specific upc. (also see Allergen Status: Determining the allergen status of a product).
 */

- (void)getAllergenAdditive:(GetAllergenAdditiveSuccess)success failure:(GetAllergenAdditiveFailure)failure sessionId:(NSString *)sessionId upc:(NSString *)upc property:(NSString *)property propertyType:(NSString *)propertyType{
    NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"getallergenadditive"];
    NSMutableString *mutableURL = [[NSMutableString alloc]init];
    [mutableURL appendString:url];
    [mutableURL appendString:[NSString stringWithFormat:@"?sid=%@", sessionId]];
    [mutableURL appendString:[NSString stringWithFormat:@"&app_id=%@",  @"ert"]];
    [mutableURL appendString:[NSString stringWithFormat:@"&f=%@", @"json"]];
    [mutableURL appendString:[NSString stringWithFormat:@"&u=%@", upc]];
    [mutableURL appendString:[NSString stringWithFormat:@"&property=%@", property]];
    [mutableURL appendString:[NSString stringWithFormat:@"&proptype=%@", propertyType]];
    [mutableURL appendString:[NSString stringWithFormat:@"&api_key=%@", API_KEY]];
    
    [self.manager GET:mutableURL parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        AIAllergenAdditve *ps = [[AIAllergenAdditve alloc]init];
        
        if (success) success(ps);
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"adf");
    }];
}



@end
