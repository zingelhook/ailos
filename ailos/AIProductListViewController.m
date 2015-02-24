//
//  AIProductListViewController.m
//  ailos
//
//  Created by kgaddy on 2/24/15.
//  Copyright (c) 2015 com.zingelhook. All rights reserved.
//

#import "AIProductListViewController.h"
#import "AIProduct.h"
#import "AIProductListView.h"
@interface AIProductListViewController ()
@property (nonatomic, strong) AIProductListView *mainView;
@property (strong, nonatomic) NSArray *tableSections;
@end

#define TABLE_DEFAULT_ROWHEIGHT 55.0
#define TABLE_DEFAULT_SECTIONHEIGHT 20.0
#define FONT_SIZE 13.0f
#define CELL_CONTENT_MARGIN 120.0f
#define CELL_DESCR_OFFSET 110.0f
@implementation AIProductListViewController

- (id)initWithProducts:(NSArray *)products{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _products = products;
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

- (AIProductListView *)mainView {
    if (!_mainView) {
        _mainView = [[AIProductListView alloc]init];
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
    return [self.products count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellObject";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        AIProduct *product = [self.products objectAtIndex:[indexPath row]];
        cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = product.productName;
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
