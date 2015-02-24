//
//  AIProfileNutrientList.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AINutrient.h"
#import "AIBaseViewController.h"
@interface AIProfileNutrientList : AIBaseViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>

typedef void (^ApplyBlock)(NSMutableArray *);
typedef void (^CancelBlock)(void (^)());

@property (strong, nonatomic) NSMutableArray *nutrients;
- (id)initWithApplyBlock:(void (^)(NSMutableArray *))applyBlock cancelBlock:(void (^)())cancelBlock nutrients:(NSArray *)nutrients;
@end
