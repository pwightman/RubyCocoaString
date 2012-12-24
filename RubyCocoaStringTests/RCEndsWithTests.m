//
//  RCEndsWithTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCEndsWithTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCEndsWithTests

- (void) testEndsWithValidCase {
	STAssertTrue([@"foobar" endsWith:@"bar"], @"endsWith: foobar should end with bar");
}

- (void) testEndsWithSameString {
	STAssertTrue([@"foo" endsWith:@"foo"], @"endsWith: foo should end with foo");
}

- (void) testEndsWithStringOnEmptyString {
	STAssertFalse([@"" endsWith:@"bar"], @"endsWith: empty string should not begin with bar");
}

@end
