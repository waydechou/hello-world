//
//  MoreTableViewController.h
//  WXMovie
//
//  Created by Wayde C. on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableViewController : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cacheLabel;

@end
