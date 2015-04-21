//
//  OrderTemplate.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "OrderTemplate.h"

@implementation OrderTemplate

-(id)initWithID:(NSString *)ID UUID:(NSString *)UUID issueDate:(NSString *)issueDate buyerCustomerParty:(Partie *)buyerCustomerParty sellerSupplierParty:(Partie *)sellerSupplierParty specialTerms:(NSString *)specialTerms orderDescription:(NSString *)orderDescription itemsArray:(NSMutableArray *)itemsArray  lineExtensionAmount:(NSString *)lineExtensionAmount  payableAmount:(NSString *)payableAmount{
    
    
    if (self=[super init]) {
        
        self.ID=ID;
        self.UUID=UUID;
        self.issueDate=issueDate;
        self.buyerCustomerParty=buyerCustomerParty;
        self.sellerSupplierParty=sellerSupplierParty;
        self.specialTerms=specialTerms;
        self.orderDescription=orderDescription;
        self.itemsArray=itemsArray;
        self.lineExtensionAmount=lineExtensionAmount;
        self.payableAmount=payableAmount;
        
    }
    return self;
}


@end
