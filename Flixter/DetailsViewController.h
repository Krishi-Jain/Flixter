//
//  DetailsViewController.h
//  Flixter
//
//  Created by Krishi Jain on 6/17/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) NSDictionary *movie;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *SynopsisLabel;

@end

NS_ASSUME_NONNULL_END
