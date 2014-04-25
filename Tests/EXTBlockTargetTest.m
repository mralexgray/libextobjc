//
//  EXTBlockTargetTest.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 2011-04-18.
//  Copyright (C) 2012 Justin Spahr-Summers.
//  Released under the MIT license.
//

#import "EXTBlockTargetTest.h"

@implementation EXTBlockTargetTest

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

- (void)testPerformAfterDelay {

    __block BOOL executed = NO;

    id target = [EXTBlockTarget
        blockTargetWithSelector:NSSelectorFromString(@"setExecuted")
        action:^{ executed = YES; }
    ];

    XCTAssertNotNil(target, @"could not initialize EXTBlockTarget instance");
    XCTAssertFalse(executed, @"block should not have executed yet");

//    [target performSelector:NSSelectorFromString(@"setExecuted")];
//    XCTAssertTrue(executed, @"block should have been executed when selector was invoked manually");

    executed = NO;

    [target performSelector:NSSelectorFromString(@"setExecuted") withObject:nil afterDelay:0];
    XCTAssertFalse(executed, @"block should not have executed yet");

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    XCTAssertTrue(executed, @"block should have executed after run loop has iterated a few times");
}

@end
#pragma clang diagnostic pop

