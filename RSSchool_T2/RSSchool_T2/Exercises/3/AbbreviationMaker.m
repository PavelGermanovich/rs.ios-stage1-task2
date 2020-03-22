#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString *no = [[NSString alloc] initWithString:@"NO"];
    NSString *yes = [[NSString alloc] initWithString:@"YES"];
    
    if (b.length > a.length) {
        return no;
    }
    
    NSUInteger aLength = [a length];
    NSUInteger bLength = [b length];
    int iA = 0;
    int jB = 0;
    while (iA < aLength && jB < bLength) {
        NSString *bChar = [b substringWithRange:NSMakeRange(jB, 1)];
        
        for (; iA < a.length; iA++) {
            NSString *aChar = [a substringWithRange:NSMakeRange(iA, 1)];
            if ([bChar isEqualToString: [aChar uppercaseString]]) {
                if (jB == bLength - 1) {
                    return yes;
                }
                jB++;
                iA++;
                break;
            } else if (![aChar isEqualToString: [aChar uppercaseString]]) {
                if (iA == aLength - 1) {
                    return no;
                }
                continue;
            }
            else {
                return no;
            }
        }
    }
    return no;
}
@end
