//
//  GetJson.m
//  GetJsonTest
//
//  Created by Lycodes_Dong on 7/1/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "GetJson.h"

@implementation GetJson

+ (NSArray *)getJsonWithURL:(NSString *)urlstring {
    NSURL *url = [NSURL URLWithString:urlstring];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return jsonArray;
}

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion {
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
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
