//
//  NSURL+GetJson.m
//  GetJsonTest
//
//  Created by Lycodes_Dong on 9/22/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "NSURL+GetJson.h"

@implementation NSURL(GetJson)

- (void)urlGetJsonWithCompletion:(void (^)(NSArray * _Nullable, NSError * _Nullable))completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:self];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (error == nil) {
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            completion(jsonArray,nil);
        }else {
            completion(nil,error);
        }
    }];
    [dataTask resume];
}

@end
