//
//  AIHomeViewController.m
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIHomeViewController.h"
#import "AIHomeView.h"
#import "AIScannerViewController.h"
#import "AISession.h"
#import "AIService.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface AIHomeViewController ()
@property (nonatomic, strong) AIHomeView *homeView;

@end

@implementation AIHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	[self loadData];
	self.title = @"Ailos";
}

- (void)loadView {
	self.view = self.homeView;
	[self.homeView updateConstraints];
}


- (void)loadData {
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	void (^success)(AISession *) = ^void (AISession *session) {
		self.session = session;
		[MBProgressHUD hideHUDForView:self.view animated:YES];
	};

	void (^failure)(NSError *) = ^void (NSError *error) {
		[MBProgressHUD hideHUDForView:self.view animated:YES];
	};

	[self.service createSession:success failure:failure];
}

- (AIHomeView *)homeView {
	if (!_homeView) {
		_homeView = [[AIHomeView alloc]init];
		[_homeView setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_homeView.scanButton addTarget:self action:@selector(scanAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _homeView;
}

- (void)scanAction:(id)sender {
	UIViewController *controller = [[AIScannerViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:controller animated:YES];
}

@end
