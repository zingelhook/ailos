//
//  AILabelHeaderView.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelHeaderView.h"

@interface AILabelHeaderView ()
@property (strong, nonatomic) UIView *contentView;
@property (assign, nonatomic) BOOL didApplyConstraints;
@property (strong, nonatomic) UILabel *titleLabel;
@end
@implementation AILabelHeaderView

- (id)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        
        _titleLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.text = title;
            //label.backgroundColor = [UIColor yellowColor];
            label.font = [UIFont boldSystemFontOfSize:14];
            label.numberOfLines = 0;
            [label setTranslatesAutoresizingMaskIntoConstraints:NO];
            label;
        });
        
        _contentView = ({
            UIView *view = [[UIView alloc]init];
            _contentView.backgroundColor = [UIColor redColor];
            [view addSubview:_titleLabel];
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
    
    [self.views setObject:self.titleLabel forKey:@"titleLabel"];
    [self.views setObject:self.contentView forKey:@"contentView"];
}

- (void)addConstraints {
    [self updateViewDictionary];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView(screenWidth)]|" options:0 metrics:self.metrics views:self.views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView(100)]|" options:0 metrics:nil views:self.views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:self.views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]" options:0 metrics:nil views:self.views]];
}


@end
