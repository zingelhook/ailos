//
//  AIBarcode.h
//  ailos
//
//  Created by kgaddy on 2/1/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

@interface AIBarcode : NSObject

+ (AIBarcode * )processMetadataObject:(AVMetadataMachineReadableCodeObject*) code;
- (NSString *) getBarcodeType;
- (NSString *) getBarcodeData;
- (void) printBarcodeData;

@end
