//
//  RCIsPresentTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCIsPresentTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCIsPresentTests

- (void) testIsPresentWithEmptyString {
	STAssertFalse([@"" isPresent], @"isPresent: \"\" should be blank");
}

- (void) testIsPresentWithWhiteSpaceString {
	STAssertFalse([@" \n\t" isPresent], @"isPresent: \" \\n\\t\" should be blank");
}

- (void) testIsPresentWithNonWhiteSpaceString {
	STAssertTrue([@"hi " isPresent], @"isPresent: \"hi \" should not be blank");
}
@end
