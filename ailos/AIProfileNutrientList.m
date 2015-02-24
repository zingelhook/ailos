//
//  AIProfileNutrientList.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProfileNutrientList.h"
#import "AINutrientsView.h"
#import "AITableCell.h"
#import "AITableSection.h"
#import "AITableRow.h"
#import "AIProfileDelegate.h"

@interface AIProfileNutrientList ()

@property (nonatomic, strong) AINutrientsView *mainView;
@property (strong, nonatomic) NSArray *tableSections;
@property (strong, nonatomic) NSMutableDictionary *tableErrors;
@property (nonatomic, copy) ApplyBlock applyHandler;
@property (nonatomic, copy) CancelBlock cancelHandler;
@end


#define TABLE_DEFAULT_ROWHEIGHT 55.0
#define TABLE_DEFAULT_SECTIONHEIGHT 20.0
#define FONT_SIZE 13.0f
#define CELL_CONTENT_MARGIN 120.0f
#define CELL_DESCR_OFFSET 110.0f

@implementation AIProfileNutrientList

- (id)initWithApplyBlock:(void (^)(NSMutableArray *))applyBlock cancelBlock:(void (^)())cancelBlock nutrients:(NSArray *)nutrients{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _nutrients = [NSMutableArray arrayWithArray:nutrients];
        _applyHandler = applyBlock;
        _cancelHandler = cancelBlock;
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}

	UIBarButtonItem *closeButton = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeAction:)];
	self.navigationItem.rightBarButtonItems = @[closeButton];
	self.title = @"Nutrients";
}

- (void)closeAction:(id)sender {
    if (self.applyHandler) {
        self.applyHandler(self.nutrients);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)loadView {
	self.view = self.mainView;
	[self.view setNeedsUpdateConstraints];
}

- (AINutrientsView *)mainView {
	if (!_mainView) {
		_mainView = [[AINutrientsView alloc]init];
		_mainView.tableView.delegate = self;
		_mainView.tableView.dataSource = self;
	}
	return _mainView;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	return [self.nutrients count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"CellObject";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		AINutrient *nutrient = [self.nutrients objectAtIndex:[indexPath row]];
		cell = [[UITableViewCell alloc]init];
		cell.textLabel.text = nutrient.name;
	}

	return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       // [self logEventForAnalyticsWithCategory:ANALYTICS_CATEGORY_ADDOBJECT action:@"Slide To Delete" label:ANALYTICS_OBJECT_LIST value:nil];
        //add code here for when you hit delete
       // NSMutableArray *mArray = [NSMutableArray arrayWithArray:self.nutrients];
       // AINutrient *obj = [self.nutrients objectAtIndex:[indexPath row]];
        
        [self.nutrients removeObjectAtIndex:[indexPath row]];
        
 
        
        // Delete the row from the table view
        [self.mainView.tableView beginUpdates];
        [self.mainView.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.mainView.tableView endUpdates];
        

    }
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return YES if you want the specified item to be editable.
	return YES;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 65;
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

@end
