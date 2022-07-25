//
//  APIHandler.h
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIHandler : NSObject

+ (NSArray *)getUpcomingtMovies;
+ (NSArray *)getPopularMovies;
+ (NSArray *)getTopRatedMovies;

@end

NS_ASSUME_NONNULL_END
