//
//  RCUnderscoreTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/27/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCUnderscoreTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCUnderscoreTests

- (void) testUnderscoreStandardUseCase {
	STAssertTrue([[@"FooBar" underscore] isEqualToString:@"foo_bar"], @"underscore: FooBar becomes foo_bar.");
}

- (void) testUnderscoreOnPreservesMultipleUnderscores {
	STAssertTrue([[@"foo___bar" underscore] isEqualToString:@"foo___bar"], @"underscore: foo___bar stays as foo___bar");
}

- (void) testUnderscoreOnEmptyString {
	STAssertTrue([[@"" underscore] isEqualToString:@""], @"underscore: doesn't throw error on empty string.");
}

- (void) testUnderscoreOnMultipleUpcasedLetters {
	STAssertTrue([[@"fooBAR" underscore] isEqualToString:@"foo_bar"], @"underscore: fooBAR should become foo_bar");
}

- (void) testUnderscoreWithHyphens {
	STAssertTrue([[@"foo-bar" underscore] isEqualToString:@"foo_bar"], @"underscore: foo-bar should become foo_bar");
}

@end
