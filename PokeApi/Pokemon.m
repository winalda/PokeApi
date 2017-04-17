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
@synthesize url = _url;

-(id) initWithName:(NSString*) Name andStringUrl:(NSString *) Url{

    if(self = [super init]){
        _nombre = Name;
        _url = Url;
    }
    
    return self;
}

@end
