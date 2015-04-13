//
//  GenerateViewController.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"

@interface GenerateViewController : ViewController

@property NSInteger *numberOrders;

- (IBAction)btnOut:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tvOrderList;

@end
