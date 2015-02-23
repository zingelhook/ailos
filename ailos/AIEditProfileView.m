//
//  AIEditProfileView.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIEditProfileView.h"
@interface AIEditProfileView ()
@property (strong, nonatomic) UIView *contentView;
//@property (strong, nonatomic) NSMutableDictionary *views;
@property (assign, nonatomic) BOOL didApplyConstraints;
@end

@implementation AIEditProfileView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
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
}

- (void)addConstraints {
    [self updateViewDictionary];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView(screenWidth)]|" options:0 metrics:self.metrics views:self.views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:self.views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:self.views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:self.views]];
}

@end
