//
//  RCUpcaseTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCUpcaseTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCUpcaseTests

- (void) testUpcaseWithLowerCaseString {
	STAssertTrue([[@"foo" upcase] isEqualToString:@"FOO"], @"upcase: foo should be FOO");
}

@end
