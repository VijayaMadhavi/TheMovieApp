//
//  CustomTableViewCell.h
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *CustomImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;

@end

NS_ASSUME_NONNULL_END
