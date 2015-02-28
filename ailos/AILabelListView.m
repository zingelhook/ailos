//
//  AILabelListView.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelListView.h"

@interface AILabelListView ()
@property (strong, nonatomic) UIView *contentView;
@property (assign, nonatomic) BOOL didApplyConstraints;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation AILabelListView

- (id)initWithTitle:(NSString *)title; {
	self = [super init];
    
	if (self) {
        self.backgroundColor = [UIColor whiteColor];
		_titleLabel = ({
			UILabel *label = [[UILabel alloc]init];
			label.text = title;
			label.font = [UIFont boldSystemFontOfSize:14];
			label.numberOfLines = 0;
			[label setTranslatesAutoresizingMaskIntoConstraints:NO];
			label;
		});


		_tableView = ({
			UITableView *table = [[UITableView alloc] init];
			[table setTranslatesAutoresizingMaskIntoConstraints:NO];
			table.backgroundColor = [UIColor clearColor];
			table.alwaysBounceVertical = YES;
			table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
			table;
		});

		_contentView = ({
			UIView *view = [[UIView alloc]init];
			_contentView.backgroundColor = [UIColor whiteColor];
			[view addSubview:_titleLabel];
			[view addSubview:_tableView];
			[view setTranslatesAutoresizingMaskIntoConstraints:NO];
			view;
		});

		[self addSubview:_contentView];
	}
	return self;
}

- (void)updateConstraints {
	[super updateConstraints];
	if (!self.didApplyConstraints) {
		self.didApplyConstraints = YES;
		[self addConstraints];
	}
}

- (void)updateViewDictionary {
	[self.views setObject:self.tableView forKey:@"tableView"];
	[self.views setObject:self.contentView forKey:@"contentView"];
	[self.views setObject:self.titleLabel forKey:@"titleLabel"];
}

- (void)addConstraints {
	[self updateViewDictionary];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView(screenWidth)]|" options:0 metrics:self.metrics views:self.views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:self.views]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:self.views]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:self.views]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[tableView]|" options:0 metrics:nil views:self.views]];
}

@end
