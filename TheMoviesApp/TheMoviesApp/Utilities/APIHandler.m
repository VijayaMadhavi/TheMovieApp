//
//  APIHandler.m
//  TheMoviesApp
//
//  Created by Vijaya Madhavi on 22/07/22.
//

#import "APIHandler.h"

@implementation APIHandler

const NSString *movieApiKey = @"faf42fb06e36b2d01006f114f3700c40";
const NSString *movieBaseUrl = @"https://api.themoviedb.org/3/movie/";

+ (NSArray *)getUpcomingtMovies {
    
    NSString *upcomingUrl = [NSString stringWithFormat:@"%@upcoming?api_key=%@", movieBaseUrl, movieApiKey];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:upcomingUrl]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %ld", upcomingUrl, [responseCode statusCode]);
        return nil;
    }
     
     NSError *e = nil;

     NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: oResponseData options: NSJSONReadingMutableContainers error: &e];
     return [jsonDict valueForKey:@"results"];
}

+ (NSArray *)getPopularMovies {
    
    NSString *popularUrl = [NSString stringWithFormat:@"%@popular?api_key=%@", movieBaseUrl, movieApiKey];
    
   NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
   [request setHTTPMethod:@"GET"];
   [request setURL:[NSURL URLWithString:popularUrl]];

   NSError *error = nil;
   NSHTTPURLResponse *responseCode = nil;

   NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
   
   if([responseCode statusCode] != 200){
       NSLog(@"Error getting %@, HTTP status code %ld", popularUrl, [responseCode statusCode]);
       return nil;
   }
    
    NSError *e = nil;

    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: oResponseData options: NSJSONReadingMutableContainers error: &e];
    return [jsonDict valueForKey:@"results"];
}

+ (NSArray *)getTopRatedMovies {
    NSString *topRatedUrl = [NSString stringWithFormat:@"%@top_rated?api_key=%@", movieBaseUrl, movieApiKey];
   NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
   [request setHTTPMethod:@"GET"];
   [request setURL:[NSURL URLWithString:topRatedUrl]];

   NSError *error = nil;
   NSHTTPURLResponse *responseCode = nil;

   NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
   
   if([responseCode statusCode] != 200){
       NSLog(@"Error getting %@, HTTP status code %ld", topRatedUrl, [responseCode statusCode]);
       return nil;
   }
    
    NSError *e = nil;

    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: oResponseData options: NSJSONReadingMutableContainers error: &e];
    return [jsonDict valueForKey:@"results"];
}

@end

