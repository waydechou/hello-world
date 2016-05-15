//
//  MovieCollectionView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "MovieCollectionView.h"
#import "PostView.h"
#import "HomeModel.h"

@implementation MovieCollectionView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
//        设置滑动的速度
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

//  Generate instance of cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth, self.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    //获取内容偏移量
    CGFloat offsetX = targetContentOffset -> x;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //计算页数
    NSInteger pageNum = (offsetX + pageWidth / 2) / pageWidth;
    
    //细节的处理 加速效果下出现偏移的情况配置
    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1 : pageNum - 1);
    
    pageNum = MIN(MAX(pageNum, 0), self.dataArray.count - 1);
    
    targetContentOffset -> x = pageNum * pageWidth;
    
//    [self scrollToItemAtIndexPath:<#(nonnull NSIndexPath *)#> atScrollPosition:<#(UICollectionViewScrollPosition)#> animated:<#(BOOL)#>]
    
    self.currentIndex = pageNum;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentIndex != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    NSInteger index = [change[@"new"] integerValue];

    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = index;
        PostView *posterView = [PostView alloc];
        if ([self isKindOfClass:NSClassFromString(@"SmallCollectionView")]) {
            
            posterView = (PostView *)self.superview.superview;
        } else {
            
            posterView = (PostView *)self.superview;
        }
        
        HomeModel *model = _dataArray[index];
        posterView.titleLabel.text = model.title;
    }
}

@end
