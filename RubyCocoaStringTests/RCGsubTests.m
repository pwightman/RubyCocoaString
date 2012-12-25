//
//  RCGsubTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCGsubTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCGsubTests

- (void) testGsubWithStringWithMatchingStrings {
	NSString *initialStr = @"Foo foo";
	
	NSString *result = [initialStr gsub:RC_REGEX(@"(Foo|foo)") withString:@"bar"];
	
	STAssertTrue([result isEqualToString:@"bar bar"], @"gsub:withString: should replace \"Foo foo\" with \"bar bar\"");
}

- (void) testGsubWithBlockWithMatchingStrings {
	NSString *initialStr = @"Foo foo";
	
	__block NSInteger value = 0;
	
	NSString *result = [initialStr gsub:RC_REGEX(@"(Foo|foo)") withBlock:^NSString *(NSString *str) {
		return [@(value++) stringValue];
	}];
	
	STAssertTrue([result isEqualToString:@"0 1"], @"gsub:withBlock: should replace \"Foo foo\" with \"bar bar\"");
}

- (void) testGsubWithBlockWithLongReplacementStrings {
	NSString *initialStr = @"Foo bar";
	
	NSString *result = [initialStr gsub:RC_REGEX(@"(Foo|bar)") withBlock:^NSString *(NSString *str) {
		return @"Some really, really long string";
	}];
	
	STAssertTrue([result isEqualToString:@"Some really, really long string Some really, really long string"], @"gsub:withBlock: should replace \"Foo foo\" with really long string");
	
}

//- (void) testGsubWithBlockWithSimpleKleeneStarExpression {
//	NSString *initialStr = @"hello";
//	
//	NSString *result = [initialStr gsub:RC_REGEX(@".*") withBlock:^NSString *(NSString *str) {
//		return @"world";
//	}];
//	
//	STAssertTrue([result isEqualToString:@"world"], @"gsub:withBlock: should replace \"Foo foo\" with \"bar bar\"");
//	
//}

@end
