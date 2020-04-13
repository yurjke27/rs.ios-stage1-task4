#import "TelephoneFinder.h"

@implementation TelephoneFinder


- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSString *digitsStr = @"1234567890";
    NSCharacterSet *digitSet = [NSCharacterSet characterSetWithCharactersInString:digitsStr];
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *closeTo0 = @[@8];
    NSArray *closeTo1 = @[@2, @4];
    NSArray *closeTo2 = @[@1, @3, @5];
    NSArray *closeTo3 = @[@2, @6];
    NSArray *closeTo4 = @[@1, @5, @7];
    NSArray *closeTo5 = @[@2, @4, @6, @8];
    NSArray *closeTo6 = @[@3, @5, @9];
    NSArray *closeTo7 = @[@4, @8];
    NSArray *closeTo8 = @[@5, @7, @9, @0];
    NSArray *closeTo9 = @[@6, @8];
    NSArray *mainArrayOfClosedNumbers = @[closeTo0, closeTo1, closeTo2, closeTo3, closeTo4, closeTo5, closeTo6, closeTo7, closeTo8, closeTo9];
    
    for (NSInteger i = 0; i < number.length; i++) {
        if(![digitSet characterIsMember:[number characterAtIndex:i]]) {
            return nil;
        }
    }
    for (NSInteger i = 0; i < number.length; i++) {
        NSMutableString *tmpStr = [NSMutableString new];
        [tmpStr appendFormat:@"%c", [number characterAtIndex:i]];
        [self replaceDigitInArray:[mainArrayOfClosedNumbers objectAtIndex:[tmpStr intValue]]  onIterate:i withNumber:number andResultArray:resultArr];
    }
    return resultArr;
}

-(void)replaceDigitInArray:(NSArray *)array onIterate:(NSInteger)iterate withNumber:(NSString*)number andResultArray:(NSMutableArray*)resultArr {
    for(NSInteger j = 0; j < array.count; j++) {
        NSMutableString *str = [NSMutableString new];
        [str appendString:[NSString stringWithFormat:@"%d", [[array objectAtIndex:j] intValue]]];
        NSRange range = NSMakeRange(iterate, 1);
        NSMutableString *numTmpStr = number.mutableCopy;
        [numTmpStr replaceCharactersInRange:range withString:str];
        [resultArr addObject:numTmpStr];
    }
}
@end
