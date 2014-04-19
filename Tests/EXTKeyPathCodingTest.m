//
//  EXTKeyPathCodingTest.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 19.06.12.
//
//

#import "EXTKeyPathCodingTest.h"

// used to test refactoring also updating @keypath() uses
@interface MyClass : NSObject
@property (nonatomic, assign) NSUInteger someUniqueProperty;
@end

@implementation EXTKeyPathCodingTest

- (void)testSingleKey {
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com:8080/search?q=foo"];
    XCTAssertNotNil(URL, @"");

    NSString *path = @keypath(URL.port);
    XCTAssertEqualObjects(path, @"port", @"");
}

- (void)testKeyPath {
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com:8080/search?q=foo"];
    XCTAssertNotNil(URL, @"");

    NSString *path = @keypath(URL.port.stringValue);
    XCTAssertEqualObjects(path, @"port.stringValue", @"");

    path = @keypath(URL.port, stringValue);
    XCTAssertEqualObjects(path, @"stringValue", @"");
}

- (void)testClassKeyPath {
    NSString *path = @keypath(NSString.class.description);
    XCTAssertEqualObjects(path, @"class.description", @"");

    path = @keypath(NSString.class, description);
    XCTAssertEqualObjects(path, @"description", @"");
}

- (void)testMyClassKeyPath {
    NSString *path = @keypath(MyClass.new, someUniqueProperty);
    XCTAssertEqualObjects(path, @"someUniqueProperty", @"");

    MyClass *obj = [[MyClass alloc] init];

    path = @keypath(obj.someUniqueProperty);
    XCTAssertEqualObjects(path, @"someUniqueProperty", @"");
}

@end

@implementation MyClass
@synthesize someUniqueProperty;
@end
