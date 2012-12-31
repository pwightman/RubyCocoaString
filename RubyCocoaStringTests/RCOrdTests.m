//
//  RCOrdTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/30/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCOrdTests.h"

@implementation RCOrdTests

- (void) testOrdStandardCase {
	STAssertTrue([@"a" ord] == 97, @"ord: 'a' should be 97");
}

- (void) testOrdLongString {
	STAssertTrue([@"abcd" ord] == 97, @"ord: 'abcd' should be 97");
}

@end
