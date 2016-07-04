//
//  GetJson.h
//  GetJsonTest
//
//  Created by Lycodes_Dong on 7/1/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetJson : NSObject

+ (void)getJsonWithTarget:(id)target Action:(SEL)action URL:(NSString *)urlstring Name:(NSString *)name;

+ (NSArray *)getJsonWithURL:(NSString *)urlstring;

@end
