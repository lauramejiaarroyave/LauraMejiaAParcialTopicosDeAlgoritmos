//
//  Partie.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "Partie.h"
#import "TouchXML.h"

@implementation Partie


-(id)initWithID:(NSInteger *)ID partyName:(NSString *)partyName postalZone:(NSString *)postalZone partyLine:(NSString *)partyLine partyCountryName:(NSString *)partyCountryName contactName:(NSString *)contactName contactTelephone:(NSString *)contactTelephone contactTelefax:(NSString *)contactTelefax  contactNote:(NSString *)contactNote{
    
    if (self=[super init]) {
        self.ID=ID;
        self.partyName=partyName;
        self.postalZone=postalZone;
        self.partyLine=partyLine;
        self.partyCountryName=partyCountryName;
        self.contactName=contactName;
        self.contactTelephone=contactTelephone;
        self.contactTelefax=contactTelefax;
        self.contactNote=contactNote;
    }
    
    return self;
}


-(NSArray *)partiesArrayClase{
    
    
    NSMutableArray *parties=[NSMutableArray array];
    

    NSError *error= nil;
    
   /* CXMLDocument *xmlParties= [[CXMLDocument alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.practicasu.webatu.com/topicosparcial/parties.xml"] options:0 error:&error];*/
    
    NSString *path=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"parties.xml"];

    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    CXMLDocument *xmlParties= [[CXMLDocument alloc] initWithData:data options:0 error:nil];
    
    if (error == nil) {
        
        
        
        NSDictionary *myNSParties= [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2", @"ns",
                                    @"urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2", @"cbc",
                                    @"urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2", @"cac", nil];
        
        
        NSArray *partiesNameArray =[[NSArray alloc] init];
        partiesNameArray = [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:PartyName/cbc:Name/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *nameArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesNameArray ) {
            
            [nameArray addObject:[elemento stringValue]];
        }
        
   //     NSLog(@"Elementos NAME  %@\n", nameArray);
        
        
        
        NSArray *partiesPostalZoneArray =[[NSArray alloc] init];
        partiesPostalZoneArray = [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:PostalAddress/cbc:PostalZone/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *postalZoneArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesPostalZoneArray ) {
            
            if ([[elemento stringValue] isEqual:@""]) {
                
                [postalZoneArray addObject:@"Not Apply"];
                
            }else{

                [postalZoneArray addObject:[elemento stringValue]];
            }
        }
        
     //   NSLog(@"Elementos POSTALZONE  %@\n", postalZoneArray);
        
        
        
        NSArray *partiesPartyLineArray =[[NSArray alloc] init];
        partiesPartyLineArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:PostalAddress/cac:AddressLine/cac:Line/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyLineArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesPartyLineArray ) {
            
            [partyLineArray addObject:[elemento stringValue]];
        }
        
   //     NSLog(@"Elementos PARTYLINE  %@\n", partyLineArray);
        
        
        NSArray *partiesCountryArray =[[NSArray alloc] init];
        partiesCountryArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:PostalAddress/cac:Country/cbc:Name/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyCountryArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesCountryArray  ) {
            
            [partyCountryArray addObject:[elemento stringValue]];
        }
        
    //    NSLog(@"Elementos PARTYcountry  %@\n", partyCountryArray);
        
        
        NSArray *partiesContactNameArray =[[NSArray alloc] init];
        partiesContactNameArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:Contact/cbc:Name/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyContactNameArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesContactNameArray  ) {
            
            [partyContactNameArray addObject:[elemento stringValue]];
        }
        
     //   NSLog(@"Elementos PARTYContactName  %@\n", partyContactNameArray);
        
        
        
        NSArray *partiesContactTelephoneArray =[[NSArray alloc] init];
        partiesContactTelephoneArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:Contact/cbc:Telephone/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyContactTelephoneArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesContactTelephoneArray) {
            
            [partyContactTelephoneArray addObject:[elemento stringValue]];
        }
        
  //      NSLog(@"Elementos PARTYContactTelephone %@\n", partyContactTelephoneArray);
        
        
        NSArray *partiesContactTelefaxArray =[[NSArray alloc] init];
        partiesContactTelefaxArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:Contact/cbc:Telefax/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyContactTelefaxArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesContactTelefaxArray) {
            
            if ([[elemento stringValue] isEqual:@""]) {
                
                [partyContactTelefaxArray addObject:@"Not Apply"];
                
            }else{
            
                [partyContactTelefaxArray addObject:[elemento stringValue]];
            }
        }
        
    //    NSLog(@"Elementos PARTYContactTeleFAX %@\n", partyContactTelefaxArray);
        
        
        NSArray *partiesContactNoteArray =[[NSArray alloc] init];
        partiesContactNoteArray= [xmlParties nodesForXPath:@"//ns:Catalogue/cac:Party/cac:Contact/cbc:Note/text()" namespaceMappings:myNSParties error:&error ];
        
        NSMutableArray *partyContactNoteArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in partiesContactNoteArray) {
            
            [partyContactNoteArray addObject:[elemento stringValue]];
        }
        
        //NSLog(@"Elementos PARTYContactNote %@\n", partyContactNoteArray);
        
 

        
        for (int i= 0; i< [nameArray count]; i++) {
            
            
            Partie *part=[[Partie alloc]initWithID:i partyName:nameArray[i] postalZone:postalZoneArray[i] partyLine:partyLineArray[i] partyCountryName:partyCountryArray[i] contactName:partyContactNameArray[i] contactTelephone:partyContactTelephoneArray[i] contactTelefax:partyContactTelefaxArray[i] contactNote:partyContactNoteArray[i]];
        
            [parties addObject:part];
            
        }

        
    }else{
        
        NSLog(@"Error  %@\n", error);
    }
    
    
    

    
    return parties.copy;
    
}



@end
