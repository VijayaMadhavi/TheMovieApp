//
//  ShowAllViewController.h
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowAllViewController : ViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *showAllTableView;

@property (nonatomic, retain) NSArray *showAllMovieArray;
@property (nonatomic, retain) NSString *navBarTitle;

@end

NS_ASSUME_NONNULL_END
