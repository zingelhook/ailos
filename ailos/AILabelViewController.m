//
//  AILabelViewController.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AILabelViewController.h"
#import "AILabelSearchResult.h"
#import "AIBaseViewController.h"
#import "AILabelListView.h"
#import "AIAllergen.h"
#import "AILabelHeaderView.h"
#import "AIAdditive.h"
#import "AILabelViewModel.h"
#import "AILabelCellView.h"

@interface AILabelViewController ()

@property (nonatomic, strong) AILabelListView *mainView;
//@property (strong, nonatomic) NSArray *tableSections;
@property (strong, nonatomic) AILabelViewModel *viewModel;
@end


#define TABLE_DEFAULT_ROWHEIGHT 55.0
#define TABLE_DEFAULT_SECTIONHEIGHT 20.0
#define FONT_SIZE 13.0f
#define CELL_CONTENT_MARGIN 120.0f
#define CELL_DESCR_OFFSET 110.0f
@implementation AILabelViewController


- (id)initWithLabelSearchResult:(AILabelSearchResult *)result {
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		_result = result;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}

	self.title = @"Products";
}

- (void)loadView {
	self.view = self.mainView;
	[self.view setNeedsUpdateConstraints];
}

- (AILabelViewModel *)viewModel {
	if (!_viewModel) {
		_viewModel = [[AILabelViewModel alloc]initWithAILabelSearchResult:self.result];
	}
	return _viewModel;
}

- (AILabelListView *)mainView {
	if (!_mainView) {
		_mainView = [[AILabelListView alloc]initWithTitle:self.result.productName];
		_mainView.tableView.delegate = self;
		_mainView.tableView.dataSource = self;
	}
	return _mainView;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Return the number of sections.
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	if (section == 0) {
		return [self.viewModel.allergens count];
	}
	else {
		return [self.result.additives count];
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	if (indexPath.section == 0) {
		static NSString *CellIdentifier = @"AllergenCellObject";

		cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

		if (cell == nil) {
			AIAllergen *allergen = [self.viewModel.allergens objectAtIndex:[indexPath row]];
			cell = [[AILabelCellView alloc]initWithAllergen:allergen];
			[cell setNeedsUpdateConstraints];
		
		}
	}
	else {
		static NSString *CellIdentifier = @"AdditiveCellObject";

		cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

		if (cell == nil) {
			AIAdditive *additive = [self.result.additives objectAtIndex:[indexPath row]];
			cell = [[UITableViewCell alloc]init];
			cell.textLabel.text = additive.additiveName;
		}
	}

	return cell;
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return YES if you want the specified item to be editable.
	return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		AIAllergen *allergen = [self.result.allergens objectAtIndex:[indexPath row]];
        NSString *ingredients = [NSString stringWithFormat:@"%@ %@", allergen.allergenRedIngredients, allergen.allergenYellowIngredients];
		NSDictionary *attributes = @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:18] };
		CGRect rect1 = [allergen.name boundingRectWithSize:CGSizeMake(self.view.frame.size.width -30, CGFLOAT_MAX)
		                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
		                                        attributes:attributes
		                                           context:nil];
		CGRect rect2 = [ingredients boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, CGFLOAT_MAX)
		                                                             options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
		                                                          attributes:attributes
		                                                             context:nil];



		CGFloat height = MAX((rect1.size.height + rect2.size.height + 20), 80.0f);

		return height;
	}
	else {
		return 90;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
	   NSArray *items = [[SPObjectStore sharedStore] allItems];
	   self.currentObj = [items objectAtIndex:[indexPath row]];
	   globalData *gd = [globalData getInstance];
	   gd.isEditMode = YES;

	   SPDetailViewController *foundVC = [[SPDetailViewController alloc] initWithFoundObject:self.currentObj];
	   foundVC.objectListDelegate = self;
	   [self.navigationController pushViewController:foundVC animated:NO];
	   [self dismissViewControllerAnimated:YES completion:nil];
	 */
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0;
}

/*
   - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
   {
    return 100.0f;
   }
 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"Allergens";
	}
	else {
		return @"Additives";
	}
}

@end
