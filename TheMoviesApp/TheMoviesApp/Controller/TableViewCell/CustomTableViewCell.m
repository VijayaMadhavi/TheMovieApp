//
//  CustomTableViewCell.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.CustomImageView.layer.cornerRadius = 10;
    self.CustomImageView.clipsToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
