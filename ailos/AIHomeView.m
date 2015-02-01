//
//  AIHomeView.m
//  ailos
//
//  Created by kgaddy on 1/31/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIHomeView.h"
#import "UIColor+ailos.h"

@interface AIHomeView ()
@property (strong, nonatomic) UIView *containerView;



@end


@implementation AIHomeView

- (id)init {
	self = [super init];

	if (self) {
		_scanButton = ({
			UIButton *button = [[UIButton alloc] init];
			[button setTitle:@"Scan" forState:UIControlStateNormal];
			[button setTranslatesAutoresizingMaskIntoConstraints:NO];
            button.backgroundColor = [UIColor buttonBackground];
			button;
		});

		_dataInputButton = ({
			UIButton *button = [[UIButton alloc] init];
			[button setTitle:@"Add Data" forState:UIControlStateNormal];
			[button setTranslatesAutoresizingMaskIntoConstraints:NO];
            button.backgroundColor = [UIColor buttonBackground];
			button;
		});

		_containerView = ({
			UIView *view = [[UIView alloc] init];
			view.backgroundColor = [UIColor screenBackgroundColor];
			[view addSubview:_scanButton];
			[view addSubview:_dataInputButton];
			[view setTranslatesAutoresizingMaskIntoConstraints:NO];

			view;
		});
		[self addSubview:_containerView];
	}
	return self;
}

- (void)updateConstraints {
	[self addConstraints];
	[super updateConstraints];
}

- (void)updateViewDictionary {
	[self.views setObject:_scanButton forKey:@"scanButton"];
	[self.views setObject:_dataInputButton forKey:@"dataInputButton"];
	[self.views setObject:_containerView forKey:@"containerView"];
}

- (void)addConstraints {
	[self updateViewDictionary];

	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView(screenWidth)]|" options:0 metrics:self.metrics views:self.views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[containerView(contentHeight)]|" options:0 metrics:self.metrics views:self.views]];

	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[scanButton]-|" options:0 metrics:nil views:self.views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[dataInputButton]-|" options:0 metrics:nil views:self.views]];



	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[scanButton(44)]-[dataInputButton(44)]" options:0 metrics:nil views:self.views]];
}

@end
