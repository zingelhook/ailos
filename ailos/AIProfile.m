//
//  AIProfile.m
//  ailos
//
//  Created by kgaddy on 2/21/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProfile.h"
#import "AINutrient.h"
#import "AIAllergen.h"
@implementation AIProfile
- (id)initWithJSON:(id)JSON {
    self = [super init];
    
    if (self) {
        NSMutableArray *mNutrients = [[NSMutableArray alloc]init];
        for (NSArray * nutrientJSON in JSON[@"nutrients"]) {
            AINutrient *n = [[AINutrient alloc]initWithJSON:nutrientJSON];
            [mNutrients addObject:n];
        }
        
        self.nutrients = [mNutrients copy];
        
        NSMutableArray *mAllergen = [[NSMutableArray alloc]init];
        for (NSArray * allergenJSON in JSON[@"allergens"]) {
            AIAllergen *a = [[AIAllergen alloc]initWithJSON:allergenJSON];
            [mAllergen addObject:a];
        }
        
        self.allergens = [mAllergen copy];
    }
    return self;
}
@end
