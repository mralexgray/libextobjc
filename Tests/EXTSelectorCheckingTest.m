//
//  EXTSelectorCheckingTest.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 26.06.12.
//  Copyright (C) 2012 Justin Spahr-Summers.
//  Released under the MIT license.
//

#import "EXTSelectorCheckingTest.h"

@implementation EXTSelectorCheckingTest

- (void)testCheckedSelectors {
    NSString *str = @"foobar";
    XCTAssertEqual(@checkselector(str, compare:, options:), @selector(compare:options:), @"");

    XCTAssertEqual(@checkselector([NSURL class], URLWithString:), @selector(URLWithString:), @"");
}

@end
