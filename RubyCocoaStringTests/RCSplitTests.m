//
//  RCSplitTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCSplitTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCSplitTests

- (void) testSplitOnSpace {
	NSString *str = @"foo bar foos";
	
	NSArray *split = [str split:@" "];
	
	STAssertTrue(split.count == 3, @"split: array count should be 3");
	
	STAssertTrue([split[0] isEqualToString:@"foo"], @"split: first element should be foo");
	STAssertTrue([split[1] isEqualToString:@"bar"], @"split: first element should be bar");
	STAssertTrue([split[2] isEqualToString:@"foos"], @"split: first element should be foos");
}

- (void) testSplitOnEmptyString {
	NSString *str = @"foo";
	
	NSArray *split = [str split:@""];
	
	STAssertTrue(split.count == 3, @"split: array count should be 3");
	
	STAssertTrue([split[0] isEqualToString:@"f"], @"split: first element should be f");
	STAssertTrue([split[1] isEqualToString:@"o"], @"split: first element should be o");
	STAssertTrue([split[2] isEqualToString:@"o"], @"split: first element should be o");
}

@end
