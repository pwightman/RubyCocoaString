//
//  RCConcatTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCConcatTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCConcatTests

- (void) testConcatWithAppendedString {
	NSString *result = [@"foo" concat:@"bar"];
	STAssertTrue([result isEqualToString:@"foobar"], @"concat: should be foobar");
}

@end
