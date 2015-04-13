//
//  Item.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSInteger *ID;
@property NSString *priceAmount;
@property NSString *itemDescription;
@property NSString *quantity;
@property NSString *lineExtensionAmount;

-(id)initWithID:(NSInteger *)ID priceAmount:(NSString *)priceAmount itemDescription:(NSString *)itemDescription quantity:(NSString *)quantity lineExtensionAmount:(NSString *)lineExtensionAmount;

-(NSArray *)itemsArrayClase;

@end
