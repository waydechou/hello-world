//
//  GuideViewController.m
//  WXMovie
//
//  Created by Wayde C. on 4/8/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "GuideViewController.h"
#import "RootTabBarController.h"

@interface GuideViewController () <UIScrollViewDelegate>

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _creatLaunchScreen];
}

- (void)_creatLaunchScreen {
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(kScreenWidth * 5, kScreenHeight);
    scroll.showsHorizontalScrollIndicator = NO;
    
    scroll.delegate = self;
    
    for (int i = 0; i < 5; i++) {
        
        NSString *imgName = [NSString stringWithFormat:@"guide%d", i +1];
        NSString *processorName = [NSString stringWithFormat:@"guideProgress%d", i +1];
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        img.image = [UIImage imageNamed:imgName];
        UIImageView *processor = [[UIImageView alloc] initWithImage:[UIImage imageNamed:processorName]];
        processor.frame = CGRectMake((kScreenWidth - processor.image.size.width) / 2, kScreenHeight - 50, processor.image.size.width, processor.image.size.height);
        
        [img addSubview:processor];
        [scroll addSubview:img];
    }
    
    [self.view addSubview:scroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == kScreenWidth * 4) {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
            
            self.view.window.rootViewController = [[RootTabBarController alloc] init];
        } completion:nil];
    }
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
