//
//  AIEditProfileViewController.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIBaseViewController.h"
#import "AIProfileDelegate.h"
@interface AIEditProfileViewController : AIBaseViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate, AIProfileDelegate>
//@property (nonatomic, weak) id<AIProfileDelegate> profileChangeDelegate;

@end
