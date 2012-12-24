//
//  RCBeginsWithTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCStartsWithTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCStartsWithTests

- (void) testStartsWithValidCase {
	STAssertTrue([@"foobar" startsWith:@"foo"], @"startsWith: foobar should start with foo");
}

- (void) testStartsWithSameString {
	STAssertTrue([@"foo" startsWith:@"foo"], @"startWith: foo should start with foo");
}

- (void) testStartsWithStringOnEmptyString {
	STAssertFalse([@"" startsWith:@"foo"], @"startsWith: empty string should not start with foo");
}

@end
