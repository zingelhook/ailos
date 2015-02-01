//
//  AIHomeViewController.m
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIHomeViewController.h"
#import "AIHomeView.h"
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

    }
    return _homeView;
}


@end
