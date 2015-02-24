//
//  AIProductListViewController.h
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIBaseViewController.h"
#import "AIProduct.h"
@interface AIProductListViewController :  AIBaseViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NSMutableArray *products;
- (id)initWithProducts:(NSArray *)products;
@end
