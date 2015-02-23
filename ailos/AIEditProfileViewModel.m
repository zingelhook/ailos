//
//  AIEditProfileViewModel.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIEditProfileViewModel.h"

@implementation AIEditProfileViewModel


- (id)initWithProfile:(AIProfile *)profile{
    self = [super init];
    
    if (self) {
        _nutrientCellText = [NSString stringWithFormat:@"Nutrients: %lu", (unsigned long)profile.nutrients.count];
     
    }
    
    return self;
}

@end
