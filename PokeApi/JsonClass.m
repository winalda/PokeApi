//
//  JsonClass.m
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import "JsonClass.h"

@implementation JsonClass

+(void)fetchFromUrl:(NSString *)url withDictionary:(void (^)(NSDictionary* data))dictionary{
    
    NSURLRequest *request = [NSURLRequest  requestWithURL:[NSURL URLWithString:url]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data
                                                                                              options:kNilOptions
                                                                                                error:&error];
                                      dictionary(dicData);
                                  }];
    
    [task resume];
}

@end
