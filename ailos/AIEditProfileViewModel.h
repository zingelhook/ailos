//
//  AIEditProfileViewModel.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIProfile.h"
@interface AIEditProfileViewModel : NSObject
@property (strong,nonatomic) NSString *nutrientCellText;
- (id)initWithProfile:(AIProfile *)profile;
@end
