//
//  ViewController.m
//  topicosParcial
//
//  Created by Laura Mejia Arroyave on 11/04/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "ViewController.h"
#import "GenerateViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    NSString *valueTv=_tvOrders.text;
    NSInteger *numberOrders=[valueTv integerValue];
    
    if (numberOrders>0 && numberOrders<=50) {

        return YES;
        
    }else{
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Debe insertar un NUMERO mayor que 0 y menor que 50" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
        [alert show];
    
        return  NO;
    }
    return NO;
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSString *valueTv=_tvOrders.text;
    NSInteger *numberOrders=[valueTv integerValue];
    
    UINavigationController *naVC = [segue destinationViewController];
    
    ((GenerateViewController *)[naVC.viewControllers firstObject]).numberOrders= numberOrders;
    

}

@end
