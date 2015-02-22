//
//  AIScannerViewController.m
//  ailos
//
//  Created by kgaddy on 2/1/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIScannerViewController.h"
#import "AIBarcode.h"
#import "AIUIFactory.h"
#import "UIColor+ailos.h"
#import "AIAllergenAdditve.h"
#import <MBProgressHUD/MBProgressHUD.h>

@import AVFoundation;   // iOS7 only import style


@interface AIScannerViewController () <AVCaptureMetadataOutputObjectsDelegate>
@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong, nonatomic) AVCaptureDevice *device;
@property (strong, nonatomic) AVCaptureDeviceInput *input;
@property (strong, nonatomic) AVCaptureMetadataOutput *output;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *prevLayer;

@property (strong, nonatomic) UIView *highlightView;
@property (strong, nonatomic) UILabel *label;
@end

@implementation AIScannerViewController


- (void)viewDidLoad {
	[super viewDidLoad];

	_highlightView = [[UIView alloc] init];
	_highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
	_highlightView.layer.borderColor = [UIColor greenColor].CGColor;
	_highlightView.layer.borderWidth = 3;
	[self.view addSubview:_highlightView];

	_label = [[UILabel alloc] init];
	_label.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
	_label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
	_label.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
	_label.textColor = [UIColor whiteColor];
	_label.textAlignment = NSTextAlignmentCenter;
	_label.text = @"Loading..";
	[self.view addSubview:_label];

	_captureSession = [[AVCaptureSession alloc] init];
	_device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	NSError *error = nil;

	_input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
	if (_input) {
		[_captureSession addInput:_input];
	}
	else {
		NSLog(@"Error: %@", error);
	}

	_output = [[AVCaptureMetadataOutput alloc] init];
	[_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
	[_captureSession addOutput:_output];

	_output.metadataObjectTypes = [_output availableMetadataObjectTypes];

	_prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
	_prevLayer.frame = self.view.bounds;
	_prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	[self.view.layer addSublayer:_prevLayer];

	[_captureSession startRunning];

	[self.view bringSubviewToFront:_highlightView];
	[self.view bringSubviewToFront:_label];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
	CGRect highlightViewRect = CGRectZero;
	AVMetadataMachineReadableCodeObject *barCodeObject;
	NSString *detectionString = nil;
	NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
	                          AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
	                          AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];

	for (AVMetadataObject *metadata in metadataObjects) {
		for (NSString *type in barCodeTypes) {
			if ([metadata.type isEqualToString:type]) {
				barCodeObject = (AVMetadataMachineReadableCodeObject *)[_prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
				highlightViewRect = barCodeObject.bounds;
				detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
				break;
			}
		}

		if (detectionString != nil) {
		
            [self getProduct:detectionString];
            
			break;
		}
		else
			_label.text = @"Looking..";
	}

	_highlightView.frame = highlightViewRect;
}

-(void)getProduct:(NSString *)upcCode{
    
    	_label.text = upcCode;
    void (^success)(AIAllergenAdditve *) = ^void (AIAllergenAdditve *allergenAdditve) {
        //self.session = session;
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    };
    
    void (^failure)(NSError *) = ^void (NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    };

   [self.service getAllergenAdditive:success failure:failure sessionId:[AISession getInstance].sessionId upc:upcCode property:@"corn" propertyType:@"allergen"];


}

@end
