//
//  Movie.m
//  Flixter
//
//  Created by Krishi Jain on 6/21/22.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
 self = [super init];

 self.title = dictionary[@"title"];
 self.synopsis = dictionary[@"overview"];

 // Set the other properties from the dictionary
    
 return self;
}

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
   // Implement this function
    for (NSDictionary *dictionary in dictionaries) {
        // Calling the Movie initializer here
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];

        [movies addObject:movie];
    }
    return movies;
}
@end
