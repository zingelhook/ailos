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

/*
   Use this to manage sessions and User ID's. You need a session id (sid) before trying any other end points to interact with the Food Essentials API. Use the "Create Session" method to create a new session id that you can then use for all other methods. (see FAQ: Sessions)
   http://developer.foodessentials.com/faq#What
 */

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
	    [session updateWithJSON:responseObject];
	    if (success) success(session);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

/*
   The FoodEssentials Personalized Dietary Profile is key and core to the API. All the product data that is returned via a call is customized in the profile. The Get Profile method gets the profile that has set what nutrients, additives, allergens, and ingredients you care about, so we can flag these products. It can be returned in XML or JSON format. It is updated (or initialized) with the Set Profile (setprofile) method. It has a default setting (shown below) so initialization is optional. There is also a detailed walk-through of the profile on our Getting Started page (also see FAQ: Profiles). This is NOT the same as a 'My List' which just stores products for a specific user.
 */
- (void)getProfile:(GetProfileSuccess)success failure:(GetProfileFailure)failure session:(AISession *)session {
	NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"getprofile"];
	NSMutableString *mutableURL = [[NSMutableString alloc]init];
	[mutableURL appendString:url];
	[mutableURL appendString:[NSString stringWithFormat:@"?sid=%@",  session.sessionId]];
	[mutableURL appendString:[NSString stringWithFormat:@"&f=%@", @"json"]];
    [mutableURL appendString:[NSString stringWithFormat:@"&api_key=%@", API_KEY]];

	[self.manager GET:mutableURL parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    NSError *error = nil;
	    AIProfile *profile = [MTLJSONAdapter modelOfClass:AIProfile.class fromJSONDictionary:responseObject error:&error];
	    if (success) success(profile);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

/*
 This is used to initially set or to update the dietary profile. Use the Set Profile (setprofile) and Add My Ingredient (addmyingredient) methods to customize your profile. It must be sent in JSON format. There is a detailed walk-through of the profile on our Getting Started page (also see FAQ: Profiles).
 */
- (void)setProfile:(GetProfileSuccess)success failure:(GetProfileFailure)failure json:(AIProfile *)json {
	NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, @"setprofile"];
	NSMutableString *mutableURL = [[NSMutableString alloc]init];
	[mutableURL appendString:url];
	[mutableURL appendString:[NSString stringWithFormat:@"?api_key=%@", API_KEY]];
    
    NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:json];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:JSONDictionary options:0 error:nil];
    NSString *JSONstr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *mmanager = [AFHTTPRequestOperationManager manager];
    
    [mmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"json": JSONstr};
    [mmanager POST:mutableURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

/*
   Search for products by keyword, including product type, product title, upc, or brand.
 */

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
	    NSError *error = nil;
	    AIProductSearchResult *ps = [MTLJSONAdapter modelOfClass:AIProductSearchResult.class fromJSONDictionary:responseObject error:&error];
	    if (success) success(ps);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

/*
   Gives a specific allergen or additive properties of a specific upc. (also see Allergen Status: Determining the allergen status of a product).
 */

- (void)getAllergenAdditive:(GetAllergenAdditiveSuccess)success failure:(GetAllergenAdditiveFailure)failure sessionId:(NSString *)sessionId upc:(NSString *)upc property:(NSString *)property propertyType:(NSString *)propertyType {
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
	   // AIAllergenAdditve *ps = [[AIAllergenAdditve alloc]init];
        NSError *error = nil;
        AIAllergenAdditve *aa = [MTLJSONAdapter modelOfClass:AIAllergenAdditve.class fromJSONDictionary:responseObject error:&error];

	    if (success) success(aa);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"adf");
	}];
}

@end
