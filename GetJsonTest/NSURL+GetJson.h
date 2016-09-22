//
//  NSURL+GetJson.h
//  GetJsonTest
//
//  Created by Lycodes_Dong on 9/22/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL(GetJson)

NS_ASSUME_NONNULL_BEGIN

- (void)urlGetJsonWithCompletion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion;

NS_ASSUME_NONNULL_END

@end
