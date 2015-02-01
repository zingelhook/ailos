//
//  UIColor+ailos.m
//  ailos
//
//  Created by kgaddy on 2/1/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "UIColor+ailos.h"

@implementation UIColor (ailos)
//navbarTextColor

+ (UIColor *)appTintColor {
    return [self colorWithHexValue:@"20bfa3"];
}

+ (UIColor *)textColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)tableSectionHeaderColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)navbarTextColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)navbarBackgroundColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)selectedValueTextColor {
    return [self colorWithHexValue:@"20bfa3"];
}

+ (UIColor *)screenBackgroundColor {
    return [self colorWithHexValue:@"ffffff"];
}

+ (UIColor *)buttonBackground {
    return [self colorWithHexValue:@"20bfa3"];
}

+ (UIColor *)buttonTextColor {
    return [self colorWithHexValue:@"ffffff"];
}

+ (UIColor *)secondaryButtonBackground {
    return [self colorWithHexValue:@"dddddd"];
}


+ (UIColor *)colorWithHexValue:(NSString *)hexValue {
    UIColor *defaultResult = [UIColor blackColor];
    
    // Strip leading # if there is one
    if ([hexValue hasPrefix:@"#"] && [hexValue length] > 1) {
        hexValue = [hexValue substringFromIndex:1];
    }
    
    NSUInteger componentLength = 0;
    
    if ([hexValue length] == 3) componentLength = 1;
    else if ([hexValue length] == 6) componentLength = 2;
    else return defaultResult;
    
    BOOL isValid = YES;
    CGFloat components[3];
    
    for (NSUInteger i = 0; i < 3; i++) {
        NSString *component = [hexValue substringWithRange:NSMakeRange(componentLength * i, componentLength)];
        
        if (componentLength == 1) {
            component = [component stringByAppendingString:component];
        }
        
        NSScanner *scanner = [NSScanner scannerWithString:component];
        unsigned int value;
        isValid &= [scanner scanHexInt:&value];
        components[i] = (CGFloat)value / 256.0;
    }
    
    if (!isValid) {
        return defaultResult;
    }
    
    return [UIColor colorWithRed:components[0]
                           green:components[1]
                            blue:components[2]
                           alpha:1.0];
}

@end
