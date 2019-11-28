//
//  NSString+GetValue.m
//
//  Created by Michal Zelinka on 8/8/13.
//  Copyright (c) 2013. All rights reserved.
//

// Input:  ...<body><h1 style="text-align: left;">Hello!</h1>...
// Usage:  s = [s getValueBetweenStarters:@[ @"<h1", ">" ] ending:@"</"];
// Output: Hello!

#import <Foundation/Foundation.h>


@implementation NSString (GetValue)

- (NSString *)getValueBetweenStarters:(nullable NSArray<NSString *> *)starters
                               ending:(nullable NSString *)ending
{
	NSRange range = NSMakeRange(0, self.length-1);

	for (NSString *starter in starters)
	{
		NSRange tmp = [self rangeOfString:starter options:kNilOptions range:range];
		if (tmp.location == NSNotFound)
			return nil;
		range.length = range.length - (tmp.location - range.location) - starter.length;
		range.location = tmp.location + starter.length;
	}

	if (ending.length)
	{
		NSRange tmp = [self rangeOfString:ending options:kNilOptions range:range];
		if (tmp.location == NSNotFound)
			return nil;
		range.length = tmp.location - range.location;
	}

	return [self substringWithRange:range];
}

@end
