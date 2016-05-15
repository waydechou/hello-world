//
//  BaseModel.m
//  WXMovie
//
//  Created by Wayde C. on 4/8/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        
        [self buildRelationshipWithDictionary:dictionary];
    }
    
    return self;
}

- (void)buildRelationshipWithDictionary:(NSDictionary *)dictionary {
    
    NSArray *allKeys = [dictionary allKeys];
    
    for (NSString *key in allKeys) {
        
        SEL method = [self changeKeyToSetKey:key];
        
        id value = dictionary[key];
        
        if ([self respondsToSelector:method]) {

            [self performSelector:method withObject:value];
        }
    }
}

- (SEL)changeKeyToSetKey:(NSString *)key {
   
    NSString *capitalizedKey = [key capitalizedString];
    
    NSString *setKey = [key isEqualToString:@"id"] ? [NSString stringWithFormat:@"set%@%@:", [self class], capitalizedKey] : [NSString stringWithFormat:@"set%@:", capitalizedKey];

    return NSSelectorFromString(setKey);
}

@end
