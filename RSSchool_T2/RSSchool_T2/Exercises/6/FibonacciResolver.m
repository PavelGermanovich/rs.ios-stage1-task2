#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSInteger trueInt = 1;
    NSInteger falseInt = 0;
    NSMutableArray *arrayNs = [[NSMutableArray alloc] init];
    int firstNumber = 0;
    int secondNumber = 1;
    
    while (true) {
        if (firstNumber * secondNumber < [number intValue]) {
            NSInteger temp = secondNumber;
            secondNumber += firstNumber;
            firstNumber = temp;
        }
        else if (secondNumber * firstNumber == [number intValue]) {
            [arrayNs addObject: [NSNumber numberWithInt:firstNumber]];
            [arrayNs addObject: [NSNumber numberWithInt:secondNumber]];
            [arrayNs addObject: [NSNumber numberWithInt:trueInt]];
            break;
        }
        else {
            [arrayNs addObject: [NSNumber numberWithInt:firstNumber]];
            [arrayNs addObject: [NSNumber numberWithInt:secondNumber]];
            [arrayNs addObject: [NSNumber numberWithInt:falseInt]];
            break;
        }
    }
    
    return arrayNs;
}
@end
