//
//  KSMasterViewController.h
//  InDict
//
//  Created by Hirohito Kato on 11/11/09.
//  Copyright (c) 2011 KatokichiSoft.
//

#import <UIKit/UIKit.h>
#import "History.h"

@class UITextChecker;
@interface KSMasterViewController : UITableViewController
<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) UITextChecker *checker;

@property (copy, nonatomic) NSString *matched;
@property (strong, nonatomic) NSArray *suggestions;
@property (strong, nonatomic) History *history;

@end
