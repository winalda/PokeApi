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
#define NUMERO_POKEMON ((int)40)

@interface ViewController ()
{
    NSMutableArray <Pokemon *> *pokemon;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nombre";
    pokemon = [[NSMutableArray alloc]init];
    
    for(int i=1;i<=NUMERO_POKEMON;i++){
    NSString *url_string = [NSString stringWithFormat:@"http://pokeapi.co/api/v2/pokemon/%i/",i];
    
    [JsonClass fetchFromUrl:url_string withDictionary:^(NSDictionary *data) {
        
        //NSLog(@"data %@",data[@"name"]);
        [pokemon addObject:[[Pokemon alloc]initWithName:data[@"name"]]];
        NSLog(@"%lu",[pokemon count]);
        
    }];
        
    }
    
    while([pokemon count]<NUMERO_POKEMON){}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pokemon count];
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


@end
