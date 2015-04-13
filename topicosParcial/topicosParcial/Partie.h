//
//  Partie.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Partie : NSObject

@property NSInteger *ID;
@property NSString *partyName;
@property NSString *postalZone;
@property NSString *partyLine;
@property NSString *partyCountryName;

@property NSString *contactName;
@property NSString *contactTelephone;
@property NSString *contactTelefax;
@property NSString *contactNote;



-(id)initWithID:(NSInteger *)ID partyName:(NSString *)partyName postalZone:(NSString *)postalZone partyLine:(NSString *)partyLine partyCountryName:(NSString *)partyCountryName contactName:(NSString *)contactName contactTelephone:(NSString *)contactTelephone contactTelefax:(NSString *)contactTelefax  contactNote:(NSString *)contactNote;

-(NSArray *)partiesArrayClase;

@end
