//
//  GetJson.m
//  GetJsonTest
//
//  Created by Lycodes_Dong on 7/1/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "GetJson.h"

@implementation GetJson

+ (void)getJsonWithTarget:(id)target Action:(SEL)action URL:(NSString *)urlstring Name:(NSString *)name {
    
    [[NSNotificationCenter defaultCenter]addObserver:target selector:action name:name object:nil];
    
    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:name object:jsonArray];
            
            [[NSNotificationCenter defaultCenter]removeObserver:target name:name object:nil];
            
        }
    }];
    
    [dataTask resume];
    
}

+ (NSArray *)getJsonWithURL:(NSString *)urlstring {
    
    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    return jsonArray;
    
}

@end
