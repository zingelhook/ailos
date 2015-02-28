//
//  AILabelListView.h
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIBaseView.h"
@interface AILabelListView : AIBaseView
@property (nonatomic,strong) UITableView *tableView;
- (id)initWithTitle:(NSString *)title;
@end
