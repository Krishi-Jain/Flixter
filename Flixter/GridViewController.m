//
//  GridViewController.m
//  Flixter
//
//  Created by Krishi Jain on 6/17/22.
//

#import "GridViewController.h"
#import "GridCell.h"
#import "UIImageView+AFNetworking.h"

@interface GridViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end

@implementation GridViewController

static NSString * const reuseIdentifier = @"GridCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self fetchMovies];
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //[self.collectionView registerClass:[GridCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)fetchMovies{
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

               self.movies = dataDictionary[@"results"];
               NSLog(@"%@", self.movies);
               for (NSDictionary *movie in self.movies){
                   NSLog(@"%@", movie[@"title"]);
               }
           }
        [self.collectionView reloadData];
       }];
    [task resume];
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.movies.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GridCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *movie = self.movies[indexPath.row];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    cell.imageView.image = nil;
    [cell.imageView setImageWithURL:posterURL];
    return cell;
}
#pragma mark <UICollectionViewDelegate>

- (void)viewDidLayoutSubviews {
   [super viewDidLayoutSubviews];

    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 10);
}

// MARK: UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int totalwidth = self.collectionView.bounds.size.width;
    int numberOfCellsPerRow = 3;
    int dimensions = (CGFloat)(totalwidth / numberOfCellsPerRow);
    return CGSizeMake(dimensions, dimensions);
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


