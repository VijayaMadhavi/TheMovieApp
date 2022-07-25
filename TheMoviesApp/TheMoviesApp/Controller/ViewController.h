//
//  ViewController.h
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *movieTableView;

@end

