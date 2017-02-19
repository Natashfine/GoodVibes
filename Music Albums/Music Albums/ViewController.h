//
//  ViewController.h
//  Music Albums
//
//  Created by Natasha Fainshtein on 05/02/2017.
//  Copyright © 2017 Natasha Fainshtein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *albumsTable;


- (IBAction)btnAddClicked:(id)sender;

@end

