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
@interface AIHomeViewController ()
@property (nonatomic,strong) AIHomeView *homeView;
@end

@implementation AIHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"Ailos";
}

- (void)loadView {
    self.view = self.homeView;
    [self.homeView updateConstraints];
    
}

-(AIHomeView *)homeView{
    if(!_homeView){
        _homeView = [[AIHomeView alloc]init];
        [_homeView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_homeView.scanButton addTarget:self action:@selector(scanAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _homeView;
}

- (void)scanAction:(id)sender {
    UIViewController *controller = [[AIScannerViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
   // [self logEventForAnalyticsWithCategory:ANALYTICS_CATEGORY_ADDOBJECT action:@"Cancel" label:ANALYTICS_OBJECT_FORM value:nil];
}

@end
