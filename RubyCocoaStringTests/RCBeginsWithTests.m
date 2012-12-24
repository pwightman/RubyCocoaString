//
//  RCBeginsWithTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCBeginsWithTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCBeginsWithTests

- (void) testBeginsWithValidCase {
	STAssertTrue([@"foobar" beginsWith:@"foo"], @"beginsWith: foobar should begin with foo");
}

- (void) testBeginsWithStringOnEmptyString {
	STAssertFalse([@"" beginsWith:@"foo"], @"beginsWith: empty string should not begin with foo");
}

@end
