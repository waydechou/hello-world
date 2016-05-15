//
//  TopViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1. Load (parse) data from json
    [self _parseJsonData];

    //2. Configurate user interface
    [self _configurateInterface];
}

- (void)_parseJsonData {

    id jsonDataArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"top250" ofType:@"json"]] options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *jsonData = jsonDataArray[@"subjects"];

    for (NSDictionary *dic in jsonData) {

        NSLog(@"%@", [dic allKeys]);
    }
}

- (void)_configurateInterface {

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
