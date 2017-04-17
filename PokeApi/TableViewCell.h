//
//  TableViewCell.h
//  PokeApi
//
//  Created by Erick on 10/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel * lblNombre;
@property (strong, nonatomic) IBOutlet UILabel * lblID;

@end
