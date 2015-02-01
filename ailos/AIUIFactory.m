//
//  AIUIFactory.m
//  ailos
//
//  Created by kgaddy on 2/1/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIUIFactory.h"
#import <UIKit/UIKit.h>
#import "UIColor+ailos.h"

@implementation AIUIFactory

+ (UIButton *)createStandardButton:(NSString *)text {
    UIButton *button = [[UIButton alloc]init];
    UIFont *buttonFont = [UIFont boldSystemFontOfSize:18];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [button setTitleColor:[UIColor buttonTextColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor buttonBackground]];
    button.opaque = NO;
    button.titleLabel.font = buttonFont;
    [button setTitle:text forState:UIControlStateNormal];
    [button sizeToFit];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return button;
}

+ (UIButton *)createSecondaryButton:(NSString *)text {
    UIButton *button = [[UIButton alloc]init];
    UIFont *buttonFont = [UIFont boldSystemFontOfSize:18];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [button setTitleColor:[UIColor buttonTextColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor secondaryButtonBackground]];
    button.opaque = NO;
    button.titleLabel.font = buttonFont;
    [button setTitle:text forState:UIControlStateNormal];
    [button sizeToFit];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return button;
}

+ (UIView *)createHRLine {
    UIView *hr = [[UIView alloc]init];
    hr.backgroundColor = [UIColor lightGrayColor];
    [hr setTranslatesAutoresizingMaskIntoConstraints:NO];
    return hr;
}

+ (UIView *)createView {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor screenBackgroundColor];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    return view;
}

@end
