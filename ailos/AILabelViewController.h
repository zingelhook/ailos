//
//  AILabelViewController.h
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIBaseViewController.h"

@interface AILabelViewController : AIBaseViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) AILabelSearchResult *result;
- (id)initWithLabelSearchResult:(AILabelSearchResult *)result;
@end
