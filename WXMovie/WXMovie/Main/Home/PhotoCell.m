//
//  PhotoCell.m
//  WXMovie
//
//  Created by Wayde C. on 4/6/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "PhotoCell.h"
#import "ImageModel.h"

@implementation PhotoCell

-(void)setImgUrl:(NSString *)imgUrl {
    
    _imgUrl = imgUrl;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];

    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.userInteractionEnabled = YES;
    [_imgView addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(savePhoto:)]];
}

- (void)savePhoto:(UIGestureRecognizer *)longPress {
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        UIImage *img = _imgView.image;
        
        if (img) {
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            
            hud.labelText = @"Saving";
            hud.dimBackground = YES;
            
            UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void * _Nullable)(hud));
        }
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"Success";
    
    [hud hide:YES afterDelay:1.5];
    NSLog(@"Photo Saved");
}

@end
