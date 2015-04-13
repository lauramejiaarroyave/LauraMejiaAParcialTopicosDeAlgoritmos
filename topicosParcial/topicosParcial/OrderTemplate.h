//
//  OrderTemplate.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partie.h"
#import "Item.h"



@interface OrderTemplate : NSObject


@property long *ID;
@property NSString *UUID;
@property NSString *issueDate;

@property Partie *buyerCustomerParty;
@property Partie *sellerSupplierParty;

@property NSString *specialTerms;
@property NSString *orderDescription;


@property NSMutableArray *itemsArray;

@property NSString *lineExtensionAmount;
@property NSString *payableAmount;


-(id)initWithID:(long *)ID UUID:(NSString *)UUID issueDate:(NSString *)issueDate buyerCustomerParty:(Partie *)buyerCustomerParty sellerSupplierParty:(Partie *)sellerSupplierParty specialTerms:(NSString *)specialTerms orderDescription:(NSString *)orderDescription itemsArray:(NSMutableArray *)itemsArray  lineExtensionAmount:(NSString *)lineExtensionAmount  payableAmount:(NSString *)payableAmount;





@end
