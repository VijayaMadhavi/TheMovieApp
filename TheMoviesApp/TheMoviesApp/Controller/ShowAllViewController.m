//
//  ShowAllViewController.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "ShowAllViewController.h"
#import "CustomTableViewCell.h"

@interface ShowAllViewController ()

@end

@implementation ShowAllViewController {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _navBarTitle;
    
    self.showAllTableView.dataSource = self;
    self.showAllTableView.delegate = self;
    
    [self.showAllTableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"customTableViewCell"];
    
    [self.showAllTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.showAllMovieArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"customTableViewCell"];
    
    NSDictionary *showAllDict = _showAllMovieArray[indexPath.row];
    
    NSString *imageLink = @"https://image.tmdb.org/t/p/w500";
    NSString *posterLink = [showAllDict valueForKey:@"poster_path"];
    NSString *url = [NSString stringWithFormat:@"%@%@", imageLink, posterLink];

    cell.CustomImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    cell.titleLabel.text = [showAllDict valueForKey:@"title"];
    cell.releaseDateLabel.text = [showAllDict valueForKey:@"release_date"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
