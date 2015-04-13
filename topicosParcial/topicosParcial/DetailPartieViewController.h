//
//  DetailPartieViewController.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"
#import "Partie.h"

@interface DetailPartieViewController : ViewController


@property Partie *party;


@property (weak, nonatomic) IBOutlet UILabel *lblName;


@property (weak, nonatomic) IBOutlet UILabel *lblPostalZ;

@property (weak, nonatomic) IBOutlet UILabel *lblLine;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblContactName;

@property (weak, nonatomic) IBOutlet UILabel *lblTelephone;
@property (weak, nonatomic) IBOutlet UILabel *lblTelefax;
@property (weak, nonatomic) IBOutlet UILabel *lblNote;


@end
