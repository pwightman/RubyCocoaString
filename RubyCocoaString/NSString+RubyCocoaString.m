//
//  NSString+RubyCocoaString.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "NSString+RubyCocoaString.h"

@implementation NSString (RubyCocoaString)

- (NSString *)capitalize {
	return [self capitalizedString];
}

- (NSString *)concat:(NSString *)aString {
	return [self stringByAppendingString:aString];
}

- (NSString *)downcase {
	return [self lowercaseString];
}

- (void) eachChar:(void (^)(NSString *))block {
	for (NSInteger i = 0; i < self.length; i++) {
		block([self substringWithRange:NSMakeRange(i, 1)]);
	}
}

- (BOOL) endsWith:(NSString *)endString {
	if (self.length < endString.length) return NO;
	return [[self substringWithRange:NSMakeRange(self.length - endString.length, endString.length)] isEqualToString:endString];
}

- (BOOL)isEmpty {
	return self.length == 0;
}

- (BOOL)isBlank {
	return [[[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""] isEmpty];
}

- (BOOL)isPresent {
	return ![self isBlank];
}

- (NSArray *)split:(NSString *)splitString {
	// The empty string should return an array of each character
	if ([splitString isEmpty]) {
		NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.length];
		
		for (NSInteger i = 0; i < self.length; i++) {
			[array addObject:[self substringWithRange:NSMakeRange(i, 1)]];
		}
		
		return array;
	} else {
		return [self componentsSeparatedByString:splitString];
	}
}

- (BOOL) startsWith:(NSString *)startString {
	if (self.length < startString.length) return NO;
	return [[self substringWithRange:NSMakeRange(0, startString.length)] isEqualToString:startString];
}


- (NSString *)strip {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)upcase {
	return [self uppercaseString];
}

@end
