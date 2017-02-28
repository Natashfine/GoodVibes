//
//  AlbumTableViewCell.m
//  Music Albums
//
//  Created by Natasha Fainshtein on 19/02/2017.
//  Copyright © 2017 Natasha Fainshtein. All rights reserved.
//

#import "AlbumTableViewCell.h"
#import "UIImageView+AFNetworking.h"

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
    
    
    self.songsArray = [[NSArray alloc] initWithArray:[dict objectForKey:@"songs"]];
    self.totalNumOfSongs = (int)[self.songsArray count];
    
    [self.artistLbl setText:[dict objectForKey:@"artist"]];
    [self.yearLbl setText:[dict objectForKey:@"year"]];
    [self.albumLbl setText:[dict objectForKey:@"name"]];
    [self loadImageWithString:[dict objectForKey:@"cover_photo"]];
    [self setSongByIndex];
    
}

-(void) setSongByIndex {
    
    [self.countLbl setText:[NSString stringWithFormat:@"%d out of %d", self.numOfSong+1 , self.totalNumOfSongs]];
    [self.timeLbl setText:[self.songsArray[self.numOfSong] objectForKey:@"length"]];
    [self.songLbl setText:[self.songsArray[self.numOfSong] objectForKey:@"name"]];
    [self.delegate setcurrentIndex:self.numOfSong toAlbum:self.albumName];
}

- (IBAction)swipeRight:(id)sender {
    
    if (self.numOfSong > 0){
        
        self.numOfSong--;
       [self setSongByIndex];
    }

}
- (IBAction)swipeLeft:(id)sender {
    
    if (self.numOfSong < self.totalNumOfSongs-1){
        
        self.numOfSong++;
       [self setSongByIndex];
    }
}

- (void) loadImageWithString:(NSString*) urlStr {
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];
    
    [self.imageAlbum setImageWithURL:url];
}




@end
