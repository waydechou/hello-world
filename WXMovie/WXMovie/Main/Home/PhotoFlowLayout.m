//
//  PhotoFlowLayout.m
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "PhotoFlowLayout.h"

@implementation PhotoFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
        self.minimumLineSpacing = 0;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

@end
