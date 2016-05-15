//
//  MoreTableViewController.m
//  WXMovie
//
//  Created by Wayde C. on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "MoreTableViewController.h"
#import "SDImageCache.h"

@interface MoreTableViewController () {
    
    UIView *headerView;
    UIButton *profileIcon;
}

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    
    [self.refreshControl addTarget:self action:@selector(refreshDataStart) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self creatProfileView];
    
    UIButton *profileIcon1 = [UIButton buttonWithType:UIButtonTypeCustom];
    NSLog(@",,,,,,%@", profileIcon1);
}

- (void)creatProfileView {
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    profileIcon = [UIButton buttonWithType:UIButtonTypeCustom];

    
    profileIcon.frame = CGRectMake(25, 25, 100, 100);
    profileIcon.layer.cornerRadius = 50;
    profileIcon.layer.masksToBounds = YES;
    [profileIcon setImage:[UIImage imageNamed:@"pig"] forState:UIControlStateNormal];
    [profileIcon addTarget:self action:@selector(changeIcon) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%@", profileIcon);
    [headerView addSubview:profileIcon];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)changeIcon {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    UIImagePickerController *imaePicker = [[UIImagePickerController alloc] init];
    imaePicker.sourceType = sourceType;
    imaePicker.delegate = self;
    
    [self presentViewController:imaePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    [profileIcon setImage:image forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self getCacheSize];
    
}

- (void)getCacheSize {
    
    NSInteger casheSize = [[SDImageCache sharedImageCache] getSize];
    self.cacheLabel.text = [NSString stringWithFormat:@"%.2fMb", casheSize / 1024.0 / 1024.0];
}

//- (NSInteger)getSize {
//    
//    NSString *homeDirectory = [NSHomeDirectory() stringByAppendingString:@"Library/Caches"];
//    
//    NSDirectoryEnumerator *fileEnumerator = [NSHomeDirectory() ]
//    return 0;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        
//        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
//            
//            [self getCacheSize];
//        }];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Clear Disk" message:@"Clear all cache" preferredStyle:UIAlertControllerStyleAlert];
        
            [alert addAction:[UIAlertAction actionWithTitle:@"Clear" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                  
                    [self getCacheSize];
                }];
            }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)refreshDataStart {
    if (self.refreshControl.refreshing) {
        
        [self.refreshControl endRefreshing];
    }
    
    self.tabBarController.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 6;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
