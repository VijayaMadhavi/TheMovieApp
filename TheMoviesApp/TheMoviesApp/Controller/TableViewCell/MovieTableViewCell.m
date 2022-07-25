//
//  MovieTableViewCell.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "MovieTableViewCell.h"
#import "MovieCollectionViewCell.h"
#import "ShowAllViewController.h"

@implementation MovieTableViewCell {
    
    NSArray *movieArray;
    
    __weak IBOutlet UIButton *viewAllbtn;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.movieCollectionView.dataSource = self;
    self.movieCollectionView.delegate = self;
    
    [self.movieCollectionView registerNib:[UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"movieCollectionViewCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewAllButton:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       ShowAllViewController *showAllVC = (ShowAllViewController *)[storyboard instantiateViewControllerWithIdentifier:@"showAll"];
    showAllVC.showAllMovieArray = movieArray;
    showAllVC.navBarTitle = _movieTitleLabel.text;
    [self.parentViewController.navigationController pushViewController:showAllVC animated:YES];
    
}

- (void)updateTableViewCellForTitle:(NSString *)title withArray:(NSArray *)array {
    
    _movieTitleLabel.text = title;
    movieArray = array;
    if([title isEqualToString:@"Upcoming Movies"])
        {
            viewAllbtn.tag = 1;
        }
    if([title isEqualToString:@"Popular Movies"])
        {
            viewAllbtn.tag = 2;
        }
    if([title isEqualToString:@"Top Rated Movies"])
        {
            viewAllbtn.tag = 3;
        }
    [self.movieCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return movieArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCollectionViewCell *cell = (MovieCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"movieCollectionViewCell" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[MovieCollectionViewCell alloc] init];
    }
    
    NSDictionary *movieDict = movieArray[indexPath.row];
    
    NSString *imageLink = @"https://image.tmdb.org/t/p/w500";
    NSString *posterLink = [movieDict valueForKey:@"poster_path"];
    NSString *url = [NSString stringWithFormat:@"%@%@", imageLink, posterLink];
    
    cell.movieImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(150, 150);
}

@end

