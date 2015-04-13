//
//  Item.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "Item.h"
#import "TouchXML.h"

@implementation Item


-(id)initWithID:(NSInteger *)ID priceAmount:(NSString *)priceAmount itemDescription:(NSString *)itemDescription quantity:(NSString *)quantity lineExtensionAmount:(NSString *)lineExtensionAmount{
    
    if (self=[super init]) {
        self.ID=ID;
        self.priceAmount=priceAmount;
        self.itemDescription=itemDescription;
        self.quantity=quantity;
        self.lineExtensionAmount=lineExtensionAmount;
    }
    
    return self;
}


-(NSArray *)itemsArrayClase{
    
    NSMutableArray *itemss=[NSMutableArray array];
    
    
    NSError *error= nil;
    
   /* CXMLDocument *xmlItems= [[CXMLDocument alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.practicasu.webatu.com/topicosparcial/items.xml"] options:0 error:&error];
    */
    
    NSString *path=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"items.xml"];
    
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    CXMLDocument *xmlItems= [[CXMLDocument alloc] initWithData:data options:0 error:nil];

    
    if (error == nil) {
        
        
        
        NSDictionary *myNSItems= [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2", @"ns",
                                  @"urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2", @"cbc",
                                  @"urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2", @"cac", nil];
        
        
        NSArray *itemsIDArray =[[NSArray alloc] init];
        itemsIDArray = [xmlItems nodesForXPath:@"//ns:Catalogue/cac:CatalogueLine/cbc:ID/text()" namespaceMappings:myNSItems error:&error ];
        
        NSMutableArray *IDArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in itemsIDArray ) {
            
            [IDArray addObject:[elemento stringValue]];
        }
        
    //    NSLog(@"Elementos ID  %@\n", IDArray);
        
        
        NSArray *itemspriceAmountArray =[[NSArray alloc] init];
        itemspriceAmountArray = [xmlItems nodesForXPath:@"//ns:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount/text()" namespaceMappings:myNSItems error:&error ];
        
        NSMutableArray *priceAmountArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in itemspriceAmountArray ) {
            
            [priceAmountArray addObject:[elemento stringValue]];
        }
        
       // NSLog(@"Elementos priceAmount  %@\n", priceAmountArray);
        
        
        NSArray *itemsDescriptionArray =[[NSArray alloc] init];
        itemsDescriptionArray = [xmlItems nodesForXPath:@"//ns:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description/text()" namespaceMappings:myNSItems error:&error ];
        
        NSMutableArray *descriptionArray= [[NSMutableArray alloc]init];
        
        for (CXMLElement *elemento in itemsDescriptionArray) {
            
            [descriptionArray addObject:[elemento stringValue]];
        }
        
      //  NSLog(@"Elementos descriptionArray  %@\n", descriptionArray);
        
        
        
        for (int i= 0; i< [IDArray count]; i++) {
            
            /*NSString *trimlat=[[NSString alloc]init];
            
            trimlat = [priceAmountArray[i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSString *newString=[[NSString alloc]init];
            
            newString = [trimlat stringByReplacingOccurrencesOfString:@"," withString:@"."];
            
            double myDouble;
            myDouble = [newString doubleValue];*/
   
            Item *ite=[[Item alloc]initWithID:i priceAmount:priceAmountArray[i] itemDescription:descriptionArray[i] quantity:@"1" lineExtensionAmount:@""];

         
            [itemss addObject:ite];
         


//            double priceeAmount = *(ite.priceAmount);
//            
//            
//            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
//            [numberFormatter setMaximumFractionDigits:2];
//     
//            NSNumber *n1 = [NSNumber numberWithDouble:priceeAmount];
//            
//            NSString *priceAmountString = [numberFormatter stringFromNumber:n1];
//       
//            
//            NSLog(@"PriceAmount  %@", priceAmountString);
         }
        
    }else{
        
        NSLog(@"Error  %@\n", error);
    }
    
    return itemss.copy;
}




@end
