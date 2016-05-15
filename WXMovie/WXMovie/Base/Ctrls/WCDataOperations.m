//
//  WCDataOperations.m
//  WXMovie
//
//  Created by Wayde C. on 4/9/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "WCDataOperations.h"

@implementation WCDataOperations

+ (id)LoadInformationFromJsonFile:(NSString *)fileName {


    //Get the path of specified json file from the directory where the current application executable is located.
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:fileName ofType:@"json"];

    //Creates and returns a data object by reading every byte from the file.
    NSData *data = [NSData dataWithContentsOfFile:filePath];

    //Get the Foundation object from given JSON data.
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    return result;
}

@end
