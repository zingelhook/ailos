//
//  AIBaseView.m
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIBaseView.h"
#import "AIConstants.h"
@implementation AIBaseView

- (NSMutableDictionary *)metrics {
    if (!_metrics) {
        _metrics = [[NSMutableDictionary alloc]init];
        [_metrics setObject:@(DEFAULT_LEFT_MARGIN) forKey:@"defaultLeftMargin"];
        [_metrics setObject:@([[UIScreen mainScreen] bounds].size.width) forKey:@"screenWidth"];
        [self.metrics setObject:@([[UIScreen mainScreen] bounds].size.height- 64)  forKey:@"contentHeight"];
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
