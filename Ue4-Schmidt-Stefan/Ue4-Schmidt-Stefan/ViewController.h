//
//  ViewController.h
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Bank;
@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *euroField;
@property (retain, nonatomic) IBOutlet UITextField *poundField;
@property (retain, nonatomic) IBOutlet UITextField *dollarField;
@property (retain, nonatomic) Bank *bank;

- (IBAction)euroChanged:(id)sender;
- (IBAction)poundChanged:(id)sender;
- (IBAction)dollarChanged:(id)sender;

@end
