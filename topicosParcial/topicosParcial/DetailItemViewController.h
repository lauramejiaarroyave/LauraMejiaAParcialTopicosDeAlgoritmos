//
//  DetailItemViewController.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"

@interface DetailItemViewController : ViewController

@property (strong, nonatomic) NSString  *selected;
@property (strong) NSMutableArray *arrayForDetalle;

@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UILabel *lblPriceAm;

@property (weak, nonatomic) IBOutlet UILabel *lblQuant;
@property (weak, nonatomic) IBOutlet UILabel *lblLineExt;

@end
