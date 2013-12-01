//
//  ViewController.m
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import "ViewController.h"
#import "Bank.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.bank = [[Bank alloc] init];
    [self.bank addRate:1.3588 from:@"EUR" to:@"USD"];
    [self.bank addRate:0.8302 from:@"EUR" to:@"GBP"];
    [self.bank addRate:0.611 from:@"USD" to:@"GBP"];
    [self.bank addRate:0.7359 from:@"USD" to:@"EUR"];
    [self.bank addRate:1.2045 from:@"GBP" to:@"EUR"];
    [self.bank addRate:1.6367 from:@"GBP" to:@"USD"];
    [self.bank retain];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [_euroField release];
    [_poundField release];
    [_dollarField release];
    [_bank release];
    [super dealloc];
}

- (IBAction)euroChanged:(id)sender
{
    double value = [[self.euroField text] doubleValue];
    Money *euro = [Money moneyWithValue:value andCurrency:@"EUR"];
    double pound = [[self.bank reduce:euro to:@"GBP"] amount];
    [self.poundField setText:[NSString stringWithFormat:@"%lf", pound]];
    double dollar = [[self.bank reduce:euro to:@"USD"] amount];
    [self.dollarField setText:[NSString stringWithFormat:@"%lf", dollar]];
}

- (IBAction)poundChanged:(id)sender
{
    double value = [[self.poundField text] doubleValue];
    Money *pound = [Money moneyWithValue:value andCurrency:@"GBP"];
    double euro = [[self.bank reduce:pound to:@"EUR"] amount];
    [self.euroField setText:[NSString stringWithFormat:@"%lf", euro]];
    double dollar = [[self.bank reduce:pound to:@"USD"] amount];
    [self.dollarField setText:[NSString stringWithFormat:@"%lf", dollar]];
}

- (IBAction)dollarChanged:(id)sender
{
    double value = [[self.dollarField text] doubleValue];
    Money *dollar = [Money moneyWithValue:value andCurrency:@"USD"];
    double euro = [[self.bank reduce:dollar to:@"EUR"] amount];
    [self.euroField setText:[NSString stringWithFormat:@"%lf", euro]];
    double pound = [[self.bank reduce:dollar to:@"GBP"] amount];
    [self.poundField setText:[NSString stringWithFormat:@"%lf", pound]];
}
@end
