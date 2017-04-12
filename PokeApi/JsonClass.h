//
//  JsonClass.h
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonClass : NSObject

+(void)fetchFromUrl:(NSString *)url withDictionary:(void (^)(NSDictionary* data))dictionary;

@end
