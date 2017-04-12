//
//  Pokemon.h
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property (strong, nonatomic) NSString * nombre;
@property (nonatomic) NSInteger * id;

-(id) initWithName:(NSString*) Name andId:(NSInteger*) ID;

@end
