//
//  MovieTableViewCell.h
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieTableViewCell : UITableViewCell <UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *movieCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@property (nonatomic, retain) UIViewController *parentViewController;

- (void)updateTableViewCellForTitle:(NSString *)title withArray:(NSArray *)array;

- (IBAction)viewAllButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
