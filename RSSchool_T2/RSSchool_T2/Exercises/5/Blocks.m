#import "Blocks.h"

@implementation Blocks {
    NSArray* _arrayWithData;
}

-(BlockA) blockA {
    return [^(NSArray *array) {
        _arrayWithData = [array copy];
    } copy];
}

- (BlockB)blockB {
    return [^(Class className) {
        if (className == [NSString class]) {
            NSMutableString *stringResult = [[NSMutableString alloc] init];
            for (int i = 0; i < [_arrayWithData count]; i++) {
                if ([_arrayWithData[i] isKindOfClass:[NSString class]]) {
                    [stringResult appendString: _arrayWithData[i]];
                }
            }
            self.blockC(stringResult);
        }
        else if (className == [NSNumber class]) {
            int sumResult = 0;
            for (int i = 0; i < [_arrayWithData count]; i++) {
                if ([_arrayWithData[i] isKindOfClass:className]) {
                    sumResult += [_arrayWithData[i] intValue];
                }
            }
            self.blockC([NSNumber numberWithInt:sumResult]);
        }
        else if (className == [NSDate class]) {
            NSDate *dateRes = [[NSDate alloc] init];
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            dateFormat.dateFormat = @"dd.MM.yyyy";
            
            for (int i = 0; i < [_arrayWithData count]; i++) {
                if ([_arrayWithData[i] isKindOfClass: [NSDate class]]) {
                    dateRes = [dateRes laterDate: (NSDate *)_arrayWithData[i]];
                }
            }
            dateRes = [dateFormat stringFromDate:dateRes];
            self.blockC(dateRes);
        }
    } copy];
}

@end

