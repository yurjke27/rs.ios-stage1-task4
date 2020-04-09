#import <XCTest/XCTest.h>
#import "SquareDecomposer.h"

@interface SquaresTests : XCTestCase
@property (nonatomic, strong) SquareDecomposer *decomposer;
@end

@implementation SquaresTests

- (void)setUp {
    self.decomposer = [[SquareDecomposer alloc] init];
}

- (void)tearDown {
    self.decomposer = nil;
}

- (void)testDecompose1 {
    NSArray *result = [self.decomposer decomposeNumber:@50];
    NSArray *expectedArray = @[@1,@3,@5,@8,@49];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose2 {
    NSArray *result = [self.decomposer decomposeNumber:@44];
    NSArray *expectedArray = @[@2,@3,@5,@7,@43];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose3 {
    NSArray *result = [self.decomposer decomposeNumber:@625];
    NSArray *expectedArray = @[@2,@5,@8,@34,@624];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose4 {
    NSArray *result = [self.decomposer decomposeNumber:@5];
    NSArray *expectedArray = @[@3,@4];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose5 {
    NSArray *result = [self.decomposer decomposeNumber:@7100];
    NSArray *expectedArray = @[@2,@3,@5,@119,@7099];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose6 {
    NSArray *result = [self.decomposer decomposeNumber:@1234567];
    NSArray *expectedArray = @[@2,@8,@32,@1571,@1234566];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose7 {
    NSArray *result = [self.decomposer decomposeNumber:@7654321];
    NSArray *expectedArray = @[@6, @10, @69, @3912, @7654320];
    XCTAssertEqualObjects(result, expectedArray);
}

- (void)testDecompose8 {
    NSArray *result = [self.decomposer decomposeNumber:@2];
    XCTAssertNil(result);
}

- (void)testDecompose9 {
    NSArray *result = [self.decomposer decomposeNumber:@-50];
    XCTAssertNil(result);
}
@end
