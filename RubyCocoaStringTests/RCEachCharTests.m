//
//  RCEachCharTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCEachCharTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCEachCharTests

- (void) testEachCharIteratesThroughChars {
	NSString *str = @"foobar";
	__block NSInteger count = 0;
	
	[@"foobar" eachChar:^(NSString *ch) {
		STAssertTrue(ch.length == 1, @"eachChar: all characters should be of length 1");
		STAssertTrue([ch characterAtIndex:0] == [str characterAtIndex:count], @"eachChar: every char is present through iteration.");
		++count;
	}];
}

@end
