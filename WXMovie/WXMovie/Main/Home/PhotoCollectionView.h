//
//  PhotoCollectionView.h
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *dataArray;

@end
