//
//  PhotoCollectionView.m
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"

@implementation PhotoCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.pagingEnabled = YES;
        
        [self registerNib:[UINib nibWithNibName:@"PhotoCell" bundle:nil] forCellWithReuseIdentifier:@"photoCell"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    cell.imgUrl = _dataArray[indexPath.row];
    
    return cell;
}
@end
