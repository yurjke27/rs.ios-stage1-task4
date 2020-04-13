#import "FullBinaryTrees.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    if(count == 1) {
        return @"[[0]]";
    } else if (count % 2 == 0 || count == 0) {
        return @"[]";
    }
    
    return 0;
}
@end
