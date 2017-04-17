//
//  ViewPokmonController.h
//  PokeApi
//
//  Created by Erick Alberto Morales Ledesma on 16/04/17.
//  Copyright © 2017 Erick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPokmonController : UIViewController

@property (strong) NSString * stringURl;

@property (nonatomic, strong) IBOutlet UILabel * lblNombre;
@property (nonatomic, strong) IBOutlet UILabel * lblId;
@property (nonatomic, strong) IBOutlet UILabel * lblBase_Experience;
@property (nonatomic, strong) IBOutlet UILabel * lblHeight;
@property (nonatomic, strong) IBOutlet UILabel * lblWeight;

@end
