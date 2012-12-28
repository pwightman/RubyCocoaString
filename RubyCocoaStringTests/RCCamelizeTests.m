//
//  RCCamelizeTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/27/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCCamelizeTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCCamelizeTests

- (void) testCamelizeWithMultipleUnderscores {
	STAssertTrue([[@"___hello___world___" camelize] isEqualToString:@"HelloWorld"], @"camelize: ___hello___world___ should be HelloWorld");
}

- (void) testCamelizeStandardUseCase {
	STAssertTrue([[@"foo_bar" camelize] isEqualToString:@"FooBar"], @"camelize: foo_bar should become FooBar");
}

- (void) testCamelizeWithOneWord {
	STAssertTrue([[@"foo" camelize] isEqualToString:@"Foo"], @"camelize: foo should become Foo");
}

- (void) testCamelizeWithTrailingUnderscore {
	STAssertTrue([[@"foo_" camelize] isEqualToString:@"Foo"], @"camelize: foo_ should become Foo");
}

@end
