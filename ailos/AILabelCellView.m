//
//  AILabelCellView.m
//  ailos
//
//  Created by kgaddy on 2/27/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelCellView.h"
#import "AIAllergen.h"

@interface AILabelCellView ()
@property (strong, nonatomic) UILabel *ingredients;
@property (assign, nonatomic) BOOL didApplyConstraints;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation AILabelCellView


- (id)initWithAllergen:(AIAllergen *)allergen {
	self = [super init];
	if (self) {
		_titleLabel = ({
			UILabel *label = [[UILabel alloc]init];
			label.text = allergen.name;

			label.font = [UIFont boldSystemFontOfSize:18];
			label.numberOfLines = 0;
			[label setTranslatesAutoresizingMaskIntoConstraints:NO];
			label;
		});

        _ingredients =({
            UILabel *label = [[UILabel alloc]init];
            label.text = [NSString stringWithFormat:@"%@ %@", allergen.allergenRedIngredients, allergen.allergenYellowIngredients];
            label.font = [UIFont systemFontOfSize:12];
            label.numberOfLines = 0;
            [label setTranslatesAutoresizingMaskIntoConstraints:NO];
            label;
        });
        
		[self addSubview:_ingredients];
		[self addSubview:_titleLabel];
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
    [self.views setObject:self.ingredients forKey:@"ingredients"];
}


- (void)addConstraints {
	[self updateViewDictionary];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ingredients]-|" options:0 metrics:nil views:self.views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:self.views]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[ingredients]" options:0 metrics:nil views:self.views]];
}

@end
