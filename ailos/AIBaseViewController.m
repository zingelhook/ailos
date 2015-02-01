//
//  AIBaseViewController.m
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIBaseViewController.h"
#import "AIConstants.h"
@interface AIBaseViewController ()

@end

@implementation AIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableDictionary *)metrics {
    if (!_metrics) {
        _metrics = [[NSMutableDictionary alloc]init];
        [_metrics setObject:@(DEFAULT_LEFT_MARGIN) forKey:@"defaultLeftMargin"];
        [_metrics setObject:@([[UIScreen mainScreen] bounds].size.width) forKey:@"screenWidth"];
        [self.metrics setObject:@(self.view.frame.size.height - 64)  forKey:@"contentHeight"];
    }
    return _metrics;
}


- (NSMutableDictionary *)views {
    if (!_views) {
        _views = [[NSMutableDictionary alloc]init];
    }
    return _views;
}

@end
