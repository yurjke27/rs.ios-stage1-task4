#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSInteger resultOfProduct = 1;
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:array];
    int negativeCount = 0;
    
    for (NSInteger i = 0; i < tmpArray.count; i++) {
        if(![[tmpArray objectAtIndex:i] isKindOfClass:[NSNumber class]]){
            [tmpArray removeObjectAtIndex:i];
            i = 0;
        }
    }
    if (tmpArray.count == 1) {
        if(!([tmpArray[0] isKindOfClass:[NSNumber class]])) {
            return 0;
        }
    }
    if (numberOfItems >= tmpArray.count) {
        for (NSInteger i = 0; i < tmpArray.count; i++) {
            resultOfProduct*= [[tmpArray objectAtIndex:i]intValue];
        }
        return resultOfProduct;
    }
    
    [tmpArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return abs([obj1 intValue]) < abs([obj2 intValue]);
    }];
    
    for (NSInteger i = 0; i < numberOfItems; i++) {
        if([[tmpArray objectAtIndex:i]intValue] < 0) {
            negativeCount++;
        }
    }
    if (negativeCount % 2 == 0) {
        for (NSInteger i = 0; i < numberOfItems; i++) {
            resultOfProduct*= [[tmpArray objectAtIndex:i]intValue];
        }
    } else {
        [tmpArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return ([obj1 intValue]) < ([obj2 intValue]);
        }];
        for (NSInteger i = 0; i < numberOfItems; i++) {
            resultOfProduct*= [[tmpArray objectAtIndex:i]intValue];
        }
    }
    
    return resultOfProduct;
}
@end
