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
    UISearchController * searchController;
    NSArray <Pokemon *> *searchResults;
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
        
    }];
    
    while([pokemones count]<=0){}
    
    NSDictionary * aux;
    
    for(int i=0;i<[pokemones count];i++){
        aux = [pokemones objectAtIndex:i];
        [pokemon addObject:[[Pokemon alloc]initWithName:aux[@"name"] andStringUrl:aux[@"url"] andID:i+1]];
    }
    
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = searchController.searchBar;
    self.definesPresentationContext = YES;
    
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(searchController.active)
    {
        return [searchResults count];
    }else
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
    
    if(searchController.active)
    {
        cell.lblNombre.text = [searchResults objectAtIndex:indexPath.row].nombre;
        cell.lblID.text = [NSString stringWithFormat:@"%i",[searchResults objectAtIndex:indexPath.row].ID];
    }else
    {
        cell.lblNombre.text = [pokemon objectAtIndex:indexPath.row].nombre;
        cell.lblID.text = [NSString stringWithFormat:@"%i",[pokemon objectAtIndex:indexPath.row].ID];
    }
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewPokmonController * viewPokemon = [[ViewPokmonController alloc] initWithNibName:@"ViewPokmonController" bundle:[NSBundle mainBundle]];
    if(searchController.active)
    {
        viewPokemon.stringURl = [searchResults objectAtIndex:indexPath.row].url;
    }else
        viewPokemon.stringURl = [pokemon objectAtIndex:indexPath.row].url;
    
    [self.navigationController pushViewController:viewPokemon animated:YES];
}

#pragma mark -Metodos de UISearchController

-(void)filterContexForSearchResults:(NSString *) searchText
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"nombre contains[c]%@",searchText];
    
    if(searchText.length > 0)
        searchResults = [pokemon filteredArrayUsingPredicate:predicate];
    else
        searchResults = pokemon;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)theSearchController
{
    [self filterContexForSearchResults:theSearchController.searchBar.text];
    [self.tableView reloadData];
}
@end
