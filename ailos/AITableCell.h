//
//  AITableCell.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AITableCell : UITableViewCell
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;
@property (nonatomic, assign) BOOL hasError;
@property (strong, nonatomic) NSMutableDictionary *metrics;
@property (strong, nonatomic) NSMutableDictionary *views;
@end
