//
//  PhotoViewController.m
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
#import "PhotoFlowLayout.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _creatSubviews];
}


- (void)_creatSubviews {
    
    PhotoFlowLayout *layout = [[PhotoFlowLayout alloc] init];
    PhotoCollectionView *photoClctView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
  
    photoClctView.dataArray = self.imgUrlArray;
    [self.view addSubview:photoClctView];

    [photoClctView scrollToItemAtIndexPath:_selectedIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
