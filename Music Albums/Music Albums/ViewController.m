//
//  ViewController.m
//  Music Albums
//
//  Created by Natasha Fainshtein on 05/02/2017.
//  Copyright © 2017 Natasha Fainshtein. All rights reserved.
//

#import "ViewController.h"
#import "AlbumTableViewCell.h"

@interface ViewController ()<AlbumCellDelegate>
 {
    
    NSArray* _albumsArray;
    NSArray* _displayArray;
    NSMutableDictionary* _indexDict;
    int clicks;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    clicks = 0;
    [self loadJson];
    _displayArray = [[NSArray alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadJson {
    
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"document" ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONWritingPrettyPrinted error:&jsonError];
    
    
    _albumsArray = [[NSArray alloc] initWithArray:[allKeys objectForKey:@"albums"]];
    _indexDict = [[NSMutableDictionary alloc] init];
    for ( int i =0; i<[_albumsArray count]; i++ ) {
        [_indexDict setObject:[NSNumber numberWithInt:0] forKey:[_albumsArray[i] objectForKey:@"name"]];
    }
        NSLog(@"%@",_albumsArray);
        
    
}

#pragma mark - Table -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return clicks;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"AlbumTableViewCell";
    
    AlbumTableViewCell *cell = (AlbumTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlbumTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    int row = (int)indexPath.row;
    NSDictionary* albumDict = _displayArray[row];
    NSNumber* numOfSong = [_indexDict objectForKey:[albumDict objectForKey:@"name"]];
    
    [cell setNumOfSong:[numOfSong integerValue]];

    
    cell.delegate = self;
    [cell setAlbumName:[albumDict objectForKey:@"name"]];
    [cell setAlbumData:albumDict];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)btnAddClicked:(id)sender {
    
    if (clicks < [_albumsArray count]){
        clicks++;
        [self manageDisplayArray];
        
    }
}

-(void) manageDisplayArray {
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSMutableArray* anArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i< clicks; i++){
        [anArray addObject:_albumsArray[i]];
    }
    
    _displayArray = [anArray sortedArrayUsingDescriptors:@[sort]];
    
    
    [self.albumsTable reloadData];
}

-(void) setcurrentIndex:(int)songIndex toAlbum:(NSString*)albumName {

    [_indexDict setObject: [NSNumber numberWithInteger: songIndex] forKey:albumName];

    
}


@end
