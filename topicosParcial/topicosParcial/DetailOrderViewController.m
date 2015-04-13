//
//  DetailOrderViewController.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "DetailOrderViewController.h"
#import "OrderTemplate.h"
#import "CeldaItemTableViewCell.h"
#import "DetailPartieViewController.h"
#import "DetailItemViewController.h"

@interface DetailOrderViewController ()

@end

@implementation DetailOrderViewController{
    NSMutableArray *itemsOrderLineArray;
    OrderTemplate *dataOrder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    itemsOrderLineArray=[NSMutableArray array];
    
    for (int i = 0 ; i < [_arrayForDetalle count]; i++) {
        
       dataOrder= [_arrayForDetalle objectAtIndex:i];
        
        
        if (i == (int)[_selected intValue]) {
            
            _lblID.text=[NSString stringWithFormat:@"%d",(int)(dataOrder.ID)];
            _lblUUID.text=dataOrder.UUID;
            _lblIssueD.text=dataOrder.issueDate;
            [_btnBuyer setTitle:dataOrder.buyerCustomerParty.partyName forState:UIControlStateNormal];
            [_btnSeller setTitle:dataOrder.sellerSupplierParty.partyName forState:UIControlStateNormal];
           
            _btnBuyer.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            _btnSeller.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            
            [_btnBuyer setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [_btnSeller setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];

            _lblSpecialTerms.text=dataOrder.specialTerms;
            _lblDescription.text=dataOrder.orderDescription;
            _lblLineExt.text=dataOrder.lineExtensionAmount;
            _lblPay.text=dataOrder.payableAmount;
            itemsOrderLineArray=dataOrder.itemsArray;
            
            
        }// Cierra el IF
    }//Cierra el for
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   return itemsOrderLineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CeldaItemTableViewCell * cell=(CeldaItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MICELDAITEM" forIndexPath:indexPath];
    
    if (!cell) {
        cell =[[CeldaItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MICELDAITEM"];
    }
    
    Item *dataItem= itemsOrderLineArray[indexPath.row];
    cell.lblItemName.text = dataItem.itemDescription;
    cell.lblItemQuantity.text=dataItem.quantity;

    
    return cell;
    
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        [self performSegueWithIdentifier:@"pushToItemDescription" sender: self];

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    
    if ([identifier isEqualToString:@"pushDetailPartyBuyer"] ||[identifier isEqualToString:@"pushDetailPartySeller"] ||[identifier isEqualToString:@"pushToItemDescription"]) {
        return YES;
    }else{

    return  NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSIndexPath *currentIndexPath = [self.tvItemsList indexPathForSelectedRow];
    NSLog(@" CLICKED ROW IS %ld",(long)currentIndexPath.row);
    
    DetailPartieViewController *detailVC = [[DetailPartieViewController alloc] init];
    
    detailVC = (DetailPartieViewController *)[segue destinationViewController];
    
    if([[segue identifier] isEqualToString:@"pushDetailPartyBuyer"]){
        
        detailVC.party=dataOrder.buyerCustomerParty;
    }
    if([[segue identifier] isEqualToString:@"pushDetailPartySeller"]){
        
        detailVC.party=dataOrder.sellerSupplierParty;
    }
    if([[segue identifier] isEqualToString:@"pushToItemDescription"]){
        
        DetailItemViewController *detailItemVC = [[DetailItemViewController alloc] init];
        
        detailItemVC = (DetailItemViewController *)[segue destinationViewController];
        
        detailItemVC.arrayForDetalle=itemsOrderLineArray.copy;
        detailItemVC.selected =[NSString stringWithFormat:@" %ld",(long)currentIndexPath.row];
    }
    
}

@end
