//
//  AIUIFactory.h
//  ailos
//
//  Created by kgaddy on 2/1/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AIUIFactory : NSObject
+ (UIView *)createHRLine;
+ (UIView *)createView;
+ (UIButton *)createStandardButton:(NSString *)text;
+ (UIButton *)createSecondaryButton:(NSString *)text
@end
