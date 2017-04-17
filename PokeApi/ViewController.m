//
//  ViewController.m
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "JsonClass.h"
#import "Pokemon.h"
#import "ViewPokmonController.h"
#define NUMERO_POKEMON ((int)40)

@interface ViewController ()
{
    NSMutableArray <Pokemon *> *pokemon;
    NSMutableArray * pokemones;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nombre";
    pokemones = [[NSMutableArray alloc]init];
    pokemon = [[NSMutableArray alloc] init];
    
    NSString *url_string = [NSString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon/?limit=811&offset=0"];
    
    [JsonClass fetchFromUrl:url_string withDictionary:^(NSDictionary *data) {
        
        pokemones = data[@"results"];
        NSLog(@"%lu",[pokemones count]);
        
    }];
    
    while([pokemones count]<=0){}
    
    NSDictionary * aux;
    
    for(int i=0;i<[pokemones count];i++){
        aux = [pokemones objectAtIndex:i];
        NSLog(@" aux ********* %@",aux);
        [pokemon addObject:[[Pokemon alloc]initWithName:aux[@"name"] andStringUrl:aux[@"url"]]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pokemones count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"TableViewCell";
    
    TableViewCell * cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lblNombre.text = [pokemon objectAtIndex:indexPath.row].nombre;
    
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Seleccionaste %lu",indexPath.row);
    ViewPokmonController * viewPokemon = [[ViewPokmonController alloc] initWithNibName:@"ViewPokmonController" bundle:[NSBundle mainBundle]];
    viewPokemon.stringURl = [pokemon objectAtIndex:indexPath.row].url;
    [self.navigationController pushViewController:viewPokemon animated:YES];
}

@end
