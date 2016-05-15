//
//  PhotoCell.h
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageModel;
@interface PhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) NSString *imgUrl;

@end
