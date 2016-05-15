//
//  NewsImageCell.m
//  WXMovie
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "NewsImageCell.h"

@implementation NewsImageCell

- (void)awakeFromNib
{
}

- (void)setModel:(ImageModel *)model
{
    _model = model;

    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];

    _imgView.layer.cornerRadius = 25;
    _imgView.layer.masksToBounds = YES;
}

@end
