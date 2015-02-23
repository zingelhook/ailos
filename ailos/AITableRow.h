//
//  AITableRow.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AITableRow : NSObject
@property (nonatomic, assign) BOOL previousNextNavigationNeeded;
@property (nonatomic, copy) UITableViewCell * (^ loadCell)(NSIndexPath *, BOOL);
@property (nonatomic, copy) void (^ didSelectRow)(NSIndexPath *);
@property (nonatomic, copy) NSString * (^ validateRow)();
@property (nonatomic, copy) CGFloat (^ calculateRowHeight)();
@end
