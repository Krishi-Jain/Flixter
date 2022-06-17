//
//  DetailsViewController.m
//  Flixter
//
//  Created by Krishi Jain on 6/17/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.movieTitleLabel.text = self.movie[@"title"];
    self.SynopsisLabel.text = self.movie[@"overview"];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *fullPosterUrl = [baseURLString stringByAppendingString:_movie[@"poster_path"]];
    NSURL *posterUrl = [NSURL URLWithString:fullPosterUrl];
    
    NSString *backdropUrl = [baseURLString stringByAppendingString:_movie[@"backdrop_path"]];
    NSURL *backposterUrl = [NSURL URLWithString:backdropUrl];

    [self.posterImageView setImageWithURL:posterUrl];
    [self.backgroundImageView setImageWithURL:backposterUrl];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
