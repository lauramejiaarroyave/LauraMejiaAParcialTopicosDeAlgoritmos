//
//  DetailPartieViewController.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "DetailPartieViewController.h"
#import "Partie.h"

@interface DetailPartieViewController ()

@end

@implementation DetailPartieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

        
            Partie *dataParty= _party;
    

            _lblName.text=dataParty.partyName;
            _lblPostalZ.text=dataParty.postalZone;
            _lblLine.text=dataParty.partyLine;
            _lblCountry.text=dataParty.partyCountryName;
            _lblContactName.text=dataParty.contactName;
            _lblTelefax.text=dataParty.contactTelefax;
            _lblTelephone.text=dataParty.contactTelephone;
            _lblNote.text=dataParty.contactNote;
        
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
