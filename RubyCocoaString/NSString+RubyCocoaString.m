//
//  NSString+RubyCocoaString.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "NSString+RubyCocoaString.h"

@implementation NSString (RubyCocoaString)

- (BOOL) beginsWith:(NSString *)beginString {
	if (self.length < beginString.length) return NO;
	return [[self substringWithRange:NSMakeRange(0, beginString.length)] isEqualToString:beginString];
}

- (NSString *)capitalize {
	return [self capitalizedString];
}

- (NSString *)concat:(NSString *)aString {
	return [self stringByAppendingString:aString];
}

- (NSString *)downcase {
	return [self lowercaseString];
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

- (NSString *)strip {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)upcase {
	return [self uppercaseString];
}

@end
