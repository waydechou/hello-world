//
//  NewsImageViewController.m
//  WXMovie
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "NewsImageViewController.h"
#import "ImageModel.h"
#import "NewsImageCell.h"
#import "PhotoViewController.h"

#define kItemWidth 80
#define kItemHeight 66
#define kItemCount 4

#define kItemSpace (kScreenWidth - kItemWidth * kItemCount)/ (kItemCount + 5)

@interface NewsImageViewController ()
{
    NSMutableArray *dataArr;
}

@end

@implementation NewsImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"图片新闻";
    //加载数据
    [self loadData];
    //配置UI
    [self configUI];
}

- (void)loadData
{
    dataArr = [NSMutableArray array];
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dic in arr) {
        ImageModel *model = [[ImageModel alloc] init];
        
        model.imageId = [dic[@"id"] integerValue];
        model.image = dic[@"image"];
        model.type = [dic[@"type"] integerValue];
        
        [dataArr addObject:model];
    }
    
    
}

- (void)configUI
{
    //适配，一行4个
    self.collectionFlowLayout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    self.collectionFlowLayout.minimumLineSpacing = kItemSpace;
    self.collectionFlowLayout.minimumInteritemSpacing = kItemSpace;
    self.collectionFlowLayout.sectionInset = UIEdgeInsetsMake(kItemSpace, kItemSpace, kItemSpace, kItemSpace);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsImageCell" forIndexPath:indexPath];
    //调用的对象是UICollectionViewCell
    cell.model = dataArr[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kItemWidth, kItemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    PhotoViewController *photoCtrl = [[PhotoViewController alloc] init];
    photoCtrl.selectedIndexPath = indexPath;
    
    NSMutableArray *array = [NSMutableArray array];
    for (ImageModel *model in dataArr) {
        
        [array addObject:model.image];
    }
    photoCtrl.imgUrlArray = array;
    [self.navigationController pushViewController:photoCtrl animated:YES];
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
