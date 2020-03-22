#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"d M yyyy";
    
    NSMutableString *currentDate = [[NSMutableString alloc] initWithString: [NSString stringWithFormat:@"%@ %@ %@", day, month, year]];
    NSLocale *localeRu = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    NSDate *inputtedDate = [formatter dateFromString:currentDate];
    
    NSDateFormatter *newFormatter = [[NSDateFormatter alloc] init];
    newFormatter.dateFormat = @"dd MMMM, EEEE";
    [newFormatter setLocale:localeRu];
    
    NSString *result = [newFormatter stringFromDate:inputtedDate];
    
    if (!result) {
        return @"Такого дня не существует";
    }
    return result;
}

@end
