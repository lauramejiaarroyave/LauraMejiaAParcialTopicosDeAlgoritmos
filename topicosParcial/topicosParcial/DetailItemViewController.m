//
//  DetailItemViewController.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "DetailItemViewController.h"
#import "Item.h"

@interface DetailItemViewController ()

@end

@implementation DetailItemViewController{
    Item *dataItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    for (int i = 0 ; i < [_arrayForDetalle count]; i++) {
        
        dataItem= [_arrayForDetalle objectAtIndex:i];
        
        
        if (i == (int)[_selected intValue]) {
            
            _lblDescription.text=dataItem.itemDescription;
            _lblLineExt.text=dataItem.lineExtensionAmount;
            _lblPriceAm.text=dataItem.priceAmount;
            _lblQuant.text=dataItem.quantity;
            
            
        }// Cierra el IF
    }//Cierra el for
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
