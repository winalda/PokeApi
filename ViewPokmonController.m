//
//  ViewPokmonController.m
//  PokeApi
//
//  Created by Erick Alberto Morales Ledesma on 16/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import "ViewPokmonController.h"
#import "JsonClass.h"

@interface ViewPokmonController ()
{
    NSDictionary * descripcionPokemon;
}
@end

@implementation ViewPokmonController

@synthesize stringURl = _stringURl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    descripcionPokemon = [[NSDictionary alloc] init];
    
    [JsonClass fetchFromUrl:_stringURl withDictionary:^(NSDictionary *data) {
        descripcionPokemon = data;
    }];
    
    self.title = @"Descripcion";
    
    while([descripcionPokemon count]<=0){
    }
    
    self.lblId.text = [NSString stringWithFormat:@"%@",descripcionPokemon[@"id"]];
    self.lblNombre.text = descripcionPokemon[@"name"];
    self.lblBase_Experience.text = [NSString stringWithFormat:@"%@",descripcionPokemon[@"base_experience"]];
    self.lblHeight.text = [NSString stringWithFormat:@"%@",descripcionPokemon[@"height"]];
    self.lblWeight.text = [NSString stringWithFormat:@"%@",descripcionPokemon[@"weight"]];
    
    NSLog(@"*********************************************************************************************");
    NSLog(@"abilities %@",descripcionPokemon[@"abilities"]);
    NSLog(@"*********************************************************************************************");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
