//
//  AITableSection.h
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AITableSection : NSObject
@property (strong, nonatomic) UIView *headerView, *footerView;
@property (strong, nonatomic) NSString *headerText, *footerText;
@property (strong, nonatomic) NSArray *rows;
@property (nonatomic, copy) CGFloat (^ calculateSectionHeight)();
@end
