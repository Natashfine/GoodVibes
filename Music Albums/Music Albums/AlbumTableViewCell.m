//
//  AlbumTableViewCell.m
//  Music Albums
//
//  Created by Natasha Fainshtein on 19/02/2017.
//  Copyright © 2017 Natasha Fainshtein. All rights reserved.
//

#import "AlbumTableViewCell.h"

@implementation AlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setAlbumData:(NSDictionary*)dict {
    
    [self.artistLbl setText:[dict objectForKey:@"artist"]];
    [self.yearLbl setText:[dict objectForKey:@"year"]];
    [self.albumLbl setText:[dict objectForKey:@"name"]];
    NSArray* songs = [[NSArray alloc] initWithArray:[dict objectForKey:@"songs"]];
    [self.countLbl setText:[NSString stringWithFormat:@"1 out of %lu", (unsigned long)[songs count]]];
    [self.timeLbl setText:[songs[0] objectForKey:@"length"]];
    [self.songLbl setText:[songs[0] objectForKey:@"name"]];
    
    NSURL *url = [NSURL URLWithString:[dict objectForKey:@"cover_photo"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];

    [self.imageAlbum setImage:image];
 
    
}

@end
