//
//  RCPrependTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/30/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCPrependTests.h"

@implementation RCPrependTests

- (void) testPrepend {
	STAssertTrue([[@"bar" prepend:@"foo"] isEqualToString:@"foobar"], @"prepend: bar prepends foo");
}

@end
