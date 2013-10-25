//
//  Tools.h
//  TestFraction
//
//  Created by kjung on 05.04.09.
//  Modified 04.10.13.
//  Copyright 2009-2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

// KJLog() works like NSLog() but does not print date and
// process info
//
void KJLog(NSString *format, ...);


// KJPrint() works like KJLog() but does not append a new
// line at the end of the output
//
void KJPrint(NSString *format, ...);


// Reads a line from the console input and returns an
// autoreleased string
NSString *KJReadLine();


// Reads a floating point number from the console input
// and returns the corresponding double value
double KJReadDouble();

