//
//  ViewController.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "ViewController.h"
#import "APIHandler.h"
#import "MovieTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    NSArray *arrayUpcomingMovies;
    NSArray *arrayPopulatMovies;
    NSArray *arrayTopRatedMovies;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Movies";
    
    self.movieTableView.dataSource = self;
    self.movieTableView.delegate = self;
    
    [self.movieTableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"movieTableViewCell"];
    
    arrayUpcomingMovies = [APIHandler getUpcomingtMovies];
    arrayPopulatMovies = [APIHandler getPopularMovies];
    arrayTopRatedMovies = [APIHandler getTopRatedMovies];
    
    [self.movieTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieTableViewCell *cell = (MovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"movieTableViewCell"];
    if (cell == nil) {
        cell = [[MovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movieTableViewCell"];
    }
    
    cell.parentViewController = self;
    if(indexPath.row == 0) {
        [cell updateTableViewCellForTitle:@"Upcoming Movies" withArray:arrayUpcomingMovies];
    } else if(indexPath.row == 1) {
        [cell updateTableViewCellForTitle:@"Popular Movies" withArray:arrayPopulatMovies];
    }  else if(indexPath.row == 2) {
        [cell updateTableViewCellForTitle:@"Top Rated Movies" withArray:arrayTopRatedMovies];
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

@end
