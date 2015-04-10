//
//  AITableCell.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AITableCell.h"

@implementation AITableCell
- (NSMutableDictionary *)metrics {
	if (!_metrics) {
		_metrics = [[NSMutableDictionary alloc]init];
		[_metrics setObject:@(15) forKey:@"defaultLeftMargin"];
		[_metrics setObject:@([[UIScreen mainScreen] bounds].size.width) forKey:@"screenWidth"];
		[_metrics setObject:@([[UIScreen mainScreen] bounds].size.height - 64) forKey:@"contentHeight"];
		[_metrics setObject:@(45) forKey:@"defaultButtonHeight"];
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
