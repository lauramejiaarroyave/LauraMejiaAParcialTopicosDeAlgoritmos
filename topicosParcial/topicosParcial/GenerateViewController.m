//
//  GenerateViewController.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "GenerateViewController.h"
#import "TouchXML.h"
#import "OrderTemplate.h"
#import "Partie.h"
#import "Item.h"
#import "CeldaTableViewCell.h"
#import "DetailOrderViewController.h"


@interface GenerateViewController ()

@end

@implementation GenerateViewController{
    
    NSArray *parties;
    NSArray *itemss;
    NSMutableArray *ordersArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    //Copie en la siguiente linea su usuario de MAC
    //Ejemplo: mi usuario es lauramejiaarroyave, entonces la próxima linea quedará:
    
    //NSString *CopiarAquiSuUsuarioDeMAC = @"lauramejiaarroyave";
    
    
    NSString *CopiarAquiSuUsuarioDeMAC = @"lauramejiaarroyave";
    
    
    
    
//--------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------
    
    
    
    
    NSDate *date = [NSDate date];

    
    ordersArray=[NSMutableArray array];
    
    for (int i=0; i<(int)_numberOrders; i++) {
        
        NSString *randomID =[[NSString alloc]init];
        


        randomID=[NSString stringWithFormat:@"%ld", [self getRandomNumberBetween:1000000000 to: 9999999999]];
        
      
       // randomID = [self getRandomNumberBetween:1000000000 to: 9999999999];
        
        NSString *vowels = @"ABCDEFGHIJKLMNOPQRSTUWXYZ12345678901234567890";
        
        NSString *randomUUID =[[NSString alloc]init];
        

                
                for (int j =0; j<8; j++) {
                    
                    randomUUID =[NSString stringWithFormat:@"%@%@",randomUUID, [vowels substringWithRange:NSMakeRange(arc4random_uniform([vowels length]), 1)]];
                }
                randomUUID =[NSString stringWithFormat:@"%@-",randomUUID];


                for (int j =0; j<4; j++) {
                    
                    randomUUID =[NSString stringWithFormat:@"%@%@",randomUUID, [vowels substringWithRange:NSMakeRange(arc4random_uniform([vowels length]), 1)]];
                }
                randomUUID =[NSString stringWithFormat:@"%@-",randomUUID];
       

                
                for (int j =0; j<4; j++) {
                    
                    randomUUID =[NSString stringWithFormat:@"%@%@",randomUUID, [vowels substringWithRange:NSMakeRange(arc4random_uniform([vowels length]), 1)]];
                }
                randomUUID =[NSString stringWithFormat:@"%@-",randomUUID];

                
                for (int j =0; j<4; j++) {
                    
                    randomUUID =[NSString stringWithFormat:@"%@%@",randomUUID, [vowels substringWithRange:NSMakeRange(arc4random_uniform([vowels length]), 1)]];
                }
                randomUUID =[NSString stringWithFormat:@"%@-",randomUUID];

                
                for (int j =0; j<12; j++) {
                    
                    randomUUID =[NSString stringWithFormat:@"%@%@",randomUUID, [vowels substringWithRange:NSMakeRange(arc4random_uniform([vowels length]), 1)]];
                }
                randomUUID =[NSString stringWithFormat:@"%@",randomUUID];

        

        NSString *randomIssueDate =[[NSString alloc]init];
        
        
        randomIssueDate= [NSString stringWithFormat:@"%ld-", [self getRandomNumberBetween:2012 to: 2015]];
        
        randomIssueDate=[NSString stringWithFormat:@"%@%ld-",randomIssueDate, [self getRandomNumberBetween:1 to: 12]];
        randomIssueDate=[NSString stringWithFormat:@"%@%ld",randomIssueDate, [self getRandomNumberBetween:1 to: 30]];
      
        
        
        // NSLog(@"Aleatorio ID %ld",randomID);
        
        // NSLog(@"Aleatorio UUID %@",randomUUID);
        //NSLog(@"Aleatorio Fecha %@",randomIssueDate);
        
        
        Partie *partie=[[Partie alloc]init];
        
        parties = [partie partiesArrayClase];
        
        Partie *randomSellerSupplier = parties[arc4random_uniform([parties count])];
        Partie *randomBuyerCustomer = parties[arc4random_uniform([parties count])];
        
       // NSLog(@"SELLER  %@\n", randomSellerSupplier.partyName);
       // NSLog(@"BUYER  %@\n",randomBuyerCustomer.partyName);
        
        
        
        int randNumItems = [self getRandomNumberIntBetween:1 to: 10];
        NSMutableArray *orderLinesArray=[NSMutableArray array];
        
        double sumatoriaOrderLines = 0.0;
        
        for (int k=0; k<randNumItems; k++) {

        
            Item *itemm=[[Item alloc]init];
            
            itemss = [itemm itemsArrayClase];
            
            Item *randomItem = itemss[arc4random_uniform([itemss count])];
            
            int q = [self getRandomNumberIntBetween:0 to: 100];
            randomItem.quantity=[NSString stringWithFormat:@"%d" ,q];
            
            NSString *trimlat=[[NSString alloc]init];
             NSString *quantityString =[[NSString alloc]init];
            
            trimlat = [randomItem.priceAmount stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            
            NSString *newString=[[NSString alloc]init];
            
            newString = [trimlat stringByReplacingOccurrencesOfString:@"," withString:@"."];
            
            quantityString = [randomItem.quantity stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            double myDouble;
            myDouble = [newString doubleValue];
            
            double myQuantity;
            myQuantity = [quantityString doubleValue];
            
            double mult;
            
            mult =myDouble*myQuantity;

            
            randomItem.lineExtensionAmount=[NSString stringWithFormat:@"%.2f",mult];
            
            
    //        NSLog(@"Item  %@\n", randomItem.itemDescription);
    //        NSLog(@"Price  %@\n", randomItem.priceAmount);
    //        
    //        NSLog(@" Quantity %@\n", randomItem.quantity);
    //        
    //        NSLog(@" Total %@\n", randomItem.lineExtensionAmount);
            
            
            Item *orderLine =[[Item alloc]initWithID:randomItem.ID priceAmount:randomItem.priceAmount itemDescription:randomItem.itemDescription quantity:randomItem.quantity lineExtensionAmount:randomItem.lineExtensionAmount];
            
            [orderLinesArray addObject:orderLine];
            
            
            sumatoriaOrderLines=sumatoriaOrderLines + mult;
        
        }
        
        NSString *payableAm= [NSString stringWithFormat:@"%.2f",sumatoriaOrderLines];
        
    
        OrderTemplate *order=[[OrderTemplate alloc]initWithID:randomID UUID:randomUUID issueDate:randomIssueDate buyerCustomerParty:randomBuyerCustomer sellerSupplierParty:randomSellerSupplier specialTerms:@"1% deduction for late delivery as per contract" orderDescription:@"order response required; payment is by BACS or by cheque<" itemsArray:orderLinesArray lineExtensionAmount:payableAm payableAmount:payableAm];
        
        
        [ordersArray addObject:order];

    
    
        NSURL *url= [NSURL fileURLWithPath:[NSString stringWithFormat:@"Users/%@/%@.xml", CopiarAquiSuUsuarioDeMAC,randomID]];
        
        
        
        
        NSString *newOrderTemp =[[NSString alloc]init];

        newOrderTemp =[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Order xmlns:cbc=\"urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2\" xmlns:cac=\"urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2\" xmlns=\"urn:oasis:names:specification:ubl:schema:xsd:Order-2\">\n<cbc:UBLVersionID>2.0</cbc:UBLVersionID>\n<cbc:ID>%@</cbc:ID>\n<cbc:CopyIndicator>false</cbc:CopyIndicator>\n<cbc:UUID>%@</cbc:UUID>\n<cbc:IssueDate>%@</cbc:IssueDate>\n<cbc:Note>sample</cbc:Note>\n\n<cac:BuyerCustomerParty>\n<cac:Party>\n<cac:PartyName>\n<cbc:Name>%@</cbc:Name>\n</cac:PartyName>\n<cac:PostalAddress>\n<cbc:PostalZone>%@</cbc:PostalZone>\n<cbc:CountrySubentity></cbc:CountrySubentity>\n<cac:AddressLine>\n<cac:Line>%@</cac:Line>\n</cac:AddressLine>\n<cac:Country>\n<cbc:Name>%@</cbc:Name>\n</cac:Country>\n</cac:PostalAddress>\n<cac:Contact>\n<cbc:Name>%@</cbc:Name><cbc:Telephone>%@</cbc:Telephone><cbc:Telefax>%@</cbc:Telefax><cbc:Note>%@</cbc:Note>\n</cac:Contact>\n</cac:Party>\n</cac:BuyerCustomerParty>\n\n<cac:SellerSupplierParty>\n<cac:Party>\n<cac:PartyName>\n<cbc:Name>%@</cbc:Name>\n</cac:PartyName>\n<cac:PostalAddress>\n<cbc:PostalZone>%@</cbc:PostalZone>\n<cbc:CountrySubentity></cbc:CountrySubentity>\n<cac:AddressLine>\n<cac:Line>%@</cac:Line>\n</cac:AddressLine>\n<cac:Country>\n<cbc:Name>%@</cbc:Name>\n</cac:Country>\n</cac:PostalAddress>\n<cac:Contact>\n<cbc:Name>%@</cbc:Name><cbc:Telephone>%@</cbc:Telephone><cbc:Telefax>%@</cbc:Telefax><cbc:Note>%@</cbc:Note>\n</cac:Contact>\n</cac:Party>\n</cac:SellerSupplierParty>\n\n<cac:DeliveryTerms>\n<cbc:SpecialTerms>1\uFF05 deduction for late delivery as per contract</cbc:SpecialTerms>\n</cac:DeliveryTerms>\n\n<cac:TransactionConditions>\n<cbc:Description>order response required; payment is by BACS or by cheque</cbc:Description>\n</cac:TransactionConditions>\n\n<cac:AnticipatedMonetaryTotal>\n<cbc:LineExtensionAmount currencyID=\"GBP\">%@</cbc:LineExtensionAmount>\n<cbc:PayableAmount currencyID=\"GBP\">%@</cbc:PayableAmount>\n</cac:AnticipatedMonetaryTotal>\n\n",order.ID,order.UUID,order.issueDate,order.buyerCustomerParty.partyName,order.buyerCustomerParty.postalZone,order.buyerCustomerParty.partyLine, order.buyerCustomerParty.partyCountryName, order.buyerCustomerParty.contactName, order.buyerCustomerParty.contactTelephone, order.buyerCustomerParty.contactTelefax, order.buyerCustomerParty.contactNote,order.sellerSupplierParty.partyName,order.sellerSupplierParty.postalZone,order.sellerSupplierParty.partyLine, order.sellerSupplierParty.partyCountryName, order.sellerSupplierParty.contactName, order.sellerSupplierParty.contactTelephone, order.sellerSupplierParty.contactTelefax, order.sellerSupplierParty.contactNote, order.lineExtensionAmount, order.payableAmount];
        
        

        NSString *addOrderLine = [[NSString alloc]init];
        
        Item *dataItem;
        for (int l= 0;  l<orderLinesArray.count; l++) {
            
            
            
            dataItem= [orderLinesArray objectAtIndex:l];

            
            addOrderLine= [NSString stringWithFormat:@"%@<cac:OrderLine>\n<cac:LineItem>\n<cbc:Quantity unitCode=\"UND\">%@</cbc:Quantity>\n<cbc:LineExtensionAmount currencyID=\"USD\">%@</cbc:LineExtensionAmount>\n<cac:Price>\n<cbc:PriceAmount currencyID=\"USD\">%@</cbc:PriceAmount>\n<cbc:BaseQuantity unitCode=\"UND\">1</cbc:BaseQuantity>\n</cac:Price>\n<cac:Item>\n<cbc:Description>%@</cbc:Description>\n</cac:Item>\n</cac:LineItem>\n</cac:OrderLine>\n\n",addOrderLine, dataItem.quantity, dataItem.lineExtensionAmount,dataItem.priceAmount, dataItem.itemDescription];
            


            
        }
        
        
        newOrderTemp= [NSString stringWithFormat:@"%@%@</Order>", newOrderTemp, addOrderLine];
        
        NSString *newFileContent=[NSString stringWithFormat:newOrderTemp];
        
        [newFileContent writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        randomID=@"x";
        
    }//Cierra el FOR de numberOrders
    
    
    double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
    
 
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"¡Congrats!" message:[NSString stringWithFormat:@" Your %d orders have been generated in %.4f Seconds", _numberOrders,timePassed_ms/1000] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    

    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnOut:(id)sender {
    
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(long)getRandomNumberBetween:(long*)from to:(long*)to {
    return (long)from + arc4random() % (to-from+1);
}
-(int)getRandomNumberIntBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ordersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CeldaTableViewCell * cell=(CeldaTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MICELDA" forIndexPath:indexPath];
    
    if (!cell) {
        cell =[[CeldaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MICELDA"];
    }
    
    OrderTemplate *dataOrder= ordersArray[indexPath.row];
    
    cell.lblUUID.text=dataOrder.UUID;
    cell.lblIssueD.text=dataOrder.issueDate;

    

    
    return cell;
}




#pragma UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"pushDetail" sender: self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSIndexPath *currentIndexPath = [self.tvOrderList indexPathForSelectedRow];
    NSLog(@" CLICKED ROW IS %ld",(long)currentIndexPath.row);
    
    
    if([[segue identifier] isEqualToString:@"pushDetail"]){
        
        DetailOrderViewController *detailVC = [[DetailOrderViewController alloc] init];
        
        detailVC = (DetailOrderViewController *)[segue destinationViewController];
        
        detailVC.arrayForDetalle=ordersArray.copy;
        detailVC.selected =[NSString stringWithFormat:@" %ld",(long)currentIndexPath.row];
    }
}

@end
