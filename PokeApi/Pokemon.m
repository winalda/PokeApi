//
//  Pokemon.m
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

@synthesize nombre = _nombre;

-(id) initWithName:(NSString*) Name andId:(NSInteger *)ID{

    if(self = [super init]){
        _nombre = Name;
    }
    
    return self;
}

@end
