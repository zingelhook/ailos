//
//  AIEditProfileViewController.m
//  ailos
//
//  Created by kgaddy on 2/22/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIEditProfileViewController.h"
#import "AIEditProfileView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "AITableCell.h" 
#import "AITableSection.h"
#import "AITableRow.h"
#import "AIEditProfileViewModel.h"

@interface AIEditProfileViewController ()
@property (nonatomic, strong) AIEditProfileView *mainView;
@property (nonatomic, strong) AIProfile *profile;
@property (strong, nonatomic) NSArray *tableSections;
@property (strong, nonatomic) NSMutableDictionary *tableErrors;
@property (strong, nonatomic) AIEditProfileViewModel *viewModel;
@end

#define TABLE_DEFAULT_ROWHEIGHT 55.0
#define TABLE_DEFAULT_SECTIONHEIGHT 20.0
#define FONT_SIZE 13.0f
#define CELL_CONTENT_MARGIN 120.0f
#define CELL_DESCR_OFFSET 110.0f

@implementation AIEditProfileViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    [self loadProfile];
}

- (void)loadView {
	self.view = self.mainView;
	[self.view setNeedsUpdateConstraints];
}

- (AIEditProfileView *)mainView {
	if (!_mainView) {
		_mainView = [[AIEditProfileView alloc]init];
		_mainView.tableView.delegate = self;
		_mainView.tableView.dataSource = self;
	}
	return _mainView;
}

- (void)loadProfile {
	[MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[self.service getProfile: ^(AIProfile *profile) {
	    [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.profile = profile;
        self.viewModel = [[AIEditProfileViewModel alloc]initWithProfile:profile];
	    [self.mainView.tableView reloadData];
	}
	                 failure: ^(NSError *error) {
	    NSLog(@"error");
	} session:self.session];

}

- (NSArray *)tableSections {
    NSMutableArray *sections = [[NSMutableArray  alloc] init];
    
    [sections addObject:[self createNutrientSection]];
       _tableSections = sections;
    
    return _tableSections;
}

#pragma mark Memo Section
- (AITableSection *)createNutrientSection {
    AITableSection *section = [[AITableSection alloc] init];
    section.headerView = nil;
    AITableRow *nutrientRow = [self createNutrientRow];
    section.rows = @[nutrientRow];
    return section;
}

- (AITableRow *)createNutrientRow {
    AITableRow *row = [[AITableRow alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath, BOOL hasError) {
        return [weakSelf createNutrientCellAtIndex:indexPath hasError:hasError text:self.viewModel.nutrientCellText];
    };
    
    row.validateRow = ^NSString * (NSIndexPath *indexPath) {
        NSString *error;
        return error;
    };
    
    return row;
}


- (UITableViewCell *)createNutrientCellAtIndex:(NSIndexPath *)index hasError:(BOOL)error text:(NSString *)text {
    UITableViewCell *cell = [self.mainView.tableView dequeueReusableCellWithIdentifier:@"nutrientsCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }

    cell.textLabel.text = text;
    return cell;
}





#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < [self.tableSections count]) {
        return [[[self.tableSections objectAtIndex:section] rows] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    AITableSection *tableSection = [self.tableSections objectAtIndex:indexPath.section];
    AITableRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    NSString *errorForCell = [self.tableErrors objectForKey:indexPath];
    
    if (tableRow.loadCell) cell = tableRow.loadCell(indexPath, errorForCell != nil);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AITableSection *tableSection = [self.tableSections objectAtIndex:indexPath.section];
    AITableRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    
    if (tableRow.didSelectRow) tableRow.didSelectRow(indexPath);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableSections count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AITableSection *tableSection = [self.tableSections objectAtIndex:indexPath.section];
    AITableRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    
    if (tableRow.calculateRowHeight) {
        return tableRow.calculateRowHeight();
    }
    else {
        return TABLE_DEFAULT_ROWHEIGHT;
    }
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 35, tableView.frame.size.width, 18)];
    
    [view setBackgroundColor:[UIColor greenColor]];
    
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = [[UIColor lightGrayColor] CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 0.5f);
    [view.layer addSublayer:upperBorder];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, TABLE_DEFAULT_SECTIONHEIGHT, view.frame.size.width, 0.5f);
    bottomBorder.backgroundColor = [[UIColor lightGrayColor] CGColor];
    [view.layer addSublayer:bottomBorder];
    
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 
        return TABLE_DEFAULT_SECTIONHEIGHT;

}

@end
