#import <XCTest/XCTest.h>
#import "TelephoneFinder.h"

@interface NeighborsTelephonesTests : XCTestCase
@property (strong, nonatomic) TelephoneFinder *finder;
@end

@implementation NeighborsTelephonesTests

- (void)setUp {
    self.finder = [TelephoneFinder new];
}

- (void)tearDown {
    self.finder = nil;
}

- (void)testFinder1 {
    NSArray *result = [self.finder findAllNumbersFromGivenNumber:@"5"];
    XCTAssertEqual(result.count, 4);
    XCTAssertTrue([result containsObject:@"2"]);
    XCTAssertTrue([result containsObject:@"4"]);
    XCTAssertTrue([result containsObject:@"6"]);
    XCTAssertTrue([result containsObject:@"8"]);
}

- (void)testFinder2 {
    NSArray *result = [self.finder findAllNumbersFromGivenNumber:@"8675309"];
    XCTAssertEqual(result.count, 18);
    XCTAssertTrue([result containsObject:@"5675309"]);
    XCTAssertTrue([result containsObject:@"7675309"]);
    XCTAssertTrue([result containsObject:@"9675309"]);
    XCTAssertTrue([result containsObject:@"0675309"]);
    XCTAssertTrue([result containsObject:@"8375309"]);
    XCTAssertTrue([result containsObject:@"8575309"]);
    XCTAssertTrue([result containsObject:@"8975309"]);
    XCTAssertTrue([result containsObject:@"8645309"]);
    XCTAssertTrue([result containsObject:@"8685309"]);
    XCTAssertTrue([result containsObject:@"8672309"]);
    XCTAssertTrue([result containsObject:@"8674309"]);
    XCTAssertTrue([result containsObject:@"8676309"]);
    XCTAssertTrue([result containsObject:@"8678309"]);
    XCTAssertTrue([result containsObject:@"8675209"]);
    XCTAssertTrue([result containsObject:@"8675609"]);
    XCTAssertTrue([result containsObject:@"8675389"]);
    XCTAssertTrue([result containsObject:@"8675306"]);
    XCTAssertTrue([result containsObject:@"8675308"]);
}

- (void)testFinder3 {
    NSArray *result = [self.finder findAllNumbersFromGivenNumber:@"-634756385"];
    XCTAssertNil(result);
}
@end
