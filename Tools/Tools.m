//
//  Tools.m
//  TestFraction
//
//  Created by kjung on 05.04.09.
//  Modified 04.10.13.
//  Copyright 2009-2013 Klaus Jung. All rights reserved.
//

#import "Tools.h"

#define MAX_LINE_LEN 200

void KJLog(NSString *format, ...)
{
	va_list args;
	va_start(args, format);
	NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
	printf("%s\n", [str UTF8String]);
	[str release];
	va_end(args);
}

void KJPrint(NSString *format, ...)
{
	va_list args;
	va_start(args, format);
	NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
	printf("%s", [str UTF8String]);
	[str release];
	va_end(args);
}

NSString *KJReadLine()
{
	char line[MAX_LINE_LEN];
	fgets(line, MAX_LINE_LEN, stdin);
	size_t len = strlen(line);
	if(len > 0 && line[len-1] == '\n') line[len-1] = '\0';
	
	return [NSString stringWithUTF8String: line];
}

double KJReadDouble()
{
    return [KJReadLine() doubleValue];
}
