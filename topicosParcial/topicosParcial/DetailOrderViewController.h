//
//  DetailOrderViewController.h
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 12/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"

@interface DetailOrderViewController : ViewController

@property (strong, nonatomic) NSString  *selected;
@property (strong) NSMutableArray *arrayForDetalle;



@property (weak, nonatomic) IBOutlet UILabel *lblID;

@property (weak, nonatomic) IBOutlet UILabel *lblUUID;
@property (weak, nonatomic) IBOutlet UILabel *lblIssueD;

@property (weak, nonatomic) IBOutlet UIButton *btnBuyer;

@property (weak, nonatomic) IBOutlet UIButton *btnSeller;

@property (weak, nonatomic) IBOutlet UILabel *lblSpecialTerms;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UILabel *lblLineExt;

@property (weak, nonatomic) IBOutlet UILabel *lblPay;

@property (weak, nonatomic) IBOutlet UITableView *tvItemsList;

@end
