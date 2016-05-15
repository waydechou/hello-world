//
//  WCDataOperations.h
//  WXMovie
//
//  Created by Wayde C. on 4/9/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCDataOperations : NSObject

// Read and return an foundation object from a json file
+ (id)LoadInformationFromJsonFile:(NSString *)fileName;

@end
