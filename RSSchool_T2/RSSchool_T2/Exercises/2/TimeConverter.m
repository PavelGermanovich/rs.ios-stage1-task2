#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSArray <NSString*>  *numberArray = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine", nil];
    
    int hoursInt = [hours intValue];
    int minsInt = [minutes intValue];
    
    if (hoursInt > 12 || hoursInt < 0 || minsInt >= 60 || minsInt < 0) {
        return @"";
    }
    else if (minsInt == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [numberArray objectAtIndex: hoursInt - 1]];
    }
    else if (minsInt < 30) {
        if (minsInt == 15) {
            return [NSString stringWithFormat:@"quarter past %@", [numberArray objectAtIndex:hoursInt - 1]];
        }
        return [NSString stringWithFormat:@"%@ minutes past %@", [numberArray objectAtIndex:minsInt - 1], [numberArray objectAtIndex:hoursInt - 1]];
    }
    else if (minsInt == 30) {
        return [NSString stringWithFormat:@"half past %@", [numberArray objectAtIndex:hoursInt - 1]];
    }
    else if (minsInt > 30) {
        if (minsInt == 45) {
            return [NSString stringWithFormat:@"quarter to %@", [numberArray objectAtIndex: hoursInt]];
        }
        
        return [NSString stringWithFormat:@"%@ minutes to %@", [numberArray objectAtIndex:60 - minsInt - 1], [numberArray objectAtIndex: hoursInt]];
    }
    else {
        return @"";
    }
    
}
@end
