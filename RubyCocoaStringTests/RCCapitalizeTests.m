//
//  RCCapitalizeTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCCapitalizeTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCCapitalizeTests

- (void) testCapitalizeWithLowercaseString {
	STAssertTrue([[@"foo" capitalize] isEqualToString:@"Foo"], @"capitalize: foo should be Foo");
}

@end
