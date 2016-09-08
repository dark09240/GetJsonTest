//
//  GetJson.h
//  GetJsonTest
//
//  Created by Lycodes_Dong on 7/1/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetJson : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (NSArray *)getJsonWithURL:(NSString *)urlstring;

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion;

NS_ASSUME_NONNULL_END

@end
