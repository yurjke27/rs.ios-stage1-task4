#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSNumber *remainder = [NSNumber numberWithLongLong:[number longLongValue] * [number longLongValue]];
    NSMutableArray *decomposeArray = [self decomposer:number withRemainder:remainder];
    if (!decomposeArray) {
        return nil;
    } else {
        [decomposeArray removeLastObject];
        return decomposeArray;
    }
}

- (NSMutableArray *)decomposer:(NSNumber *)n withRemainder:(NSNumber *)remainder {
    if ([remainder intValue] == 0) {
        return [NSMutableArray arrayWithObject:n];
    }
    
    for(NSInteger i = [n intValue] - 1; i > 0; i--) {
        if(([remainder longValue] - i*i) >= 0){
            NSNumber *newN = [NSNumber numberWithLongLong:i];
            NSNumber *newRemainder = [NSNumber numberWithLongLong:([remainder longValue] - i*i)];
            NSMutableArray *resultArray = [self decomposer:newN withRemainder:newRemainder];
            if (resultArray){
                [resultArray addObject:n];
                return resultArray;
            }
        }
    }
    return nil;
}

@end
