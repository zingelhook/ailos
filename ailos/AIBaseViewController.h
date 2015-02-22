//
//  AIBaseViewController.h
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AISession.h"
#import "AIService.h"

@interface AIBaseViewController : UIViewController
@property (strong, nonatomic) NSMutableDictionary *metrics;
@property (strong, nonatomic) NSMutableDictionary *views;
@property (strong, nonatomic) AISession *session;
@property (strong, nonatomic) AIService *service;
@end
