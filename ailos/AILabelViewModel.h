//
//  AILabelViewModel.h
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AILabelSearchResult.h"
@interface AILabelViewModel : NSObject

@property (strong, nonatomic) NSArray *allergens;
@property (strong, nonatomic) NSArray *additives;
- (id)initWithAILabelSearchResult:(AILabelSearchResult *)result;

@end
