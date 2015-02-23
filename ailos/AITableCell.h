//
//  AITableCell.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AITableCell : NSObject
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;
@property (nonatomic, assign) BOOL hasError;
@property (strong, nonatomic) NSMutableDictionary *metrics;
@end
