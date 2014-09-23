//
//  TableViewController.h
//  HN_Feed
//
//  Created by Sebastián Valencia on 7/17/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *news;
@property int currentCell;
@property (nonatomic, strong) NSArray *flatColors;
@property (nonatomic, strong) NSArray *cellColors;

@end
