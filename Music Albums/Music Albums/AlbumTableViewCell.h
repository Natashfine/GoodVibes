//
//  AlbumTableViewCell.h
//  Music Albums
//
//  Created by Natasha Fainshtein on 19/02/2017.
//  Copyright © 2017 Natasha Fainshtein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageAlbum;
@property (weak, nonatomic) IBOutlet UILabel *artistLbl;
@property (weak, nonatomic) IBOutlet UILabel *albumLbl;
@property (weak, nonatomic) IBOutlet UILabel *songLbl;
@property (weak, nonatomic) IBOutlet UILabel *countLbl;
@property (weak, nonatomic) IBOutlet UILabel *yearLbl;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

@property (nonatomic, assign) int numOfSong;
@property (nonatomic, assign) int totalNumOfSongs;
@property (retain, nonatomic) NSArray *songsArray;

- (void) setAlbumData:(NSDictionary*)dict;


@end
