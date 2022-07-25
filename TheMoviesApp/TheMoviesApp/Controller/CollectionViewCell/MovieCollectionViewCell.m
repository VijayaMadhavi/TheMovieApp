//
//  MovieCollectionViewCell.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.movieImageView.layer.cornerRadius = 10;
    self.movieImageView.clipsToBounds = true;
}

@end
