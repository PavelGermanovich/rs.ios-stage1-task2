#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
    [characterSet formUnionWithCharacterSet: NSCharacterSet.lowercaseLetterCharacterSet];
    NSMutableArray *rasdf = [[NSMutableArray alloc] init];
    
    NSMutableString *stringResult = [[NSMutableString alloc] initWithString:self];

    
    if ([self isSentencePangram]) {
        stringResult = [self replaceAllVowelsToUpperCase:stringResult];
        NSMutableArray *arrayResult = [self addNumberOfVowelsForEachWordInArray: [stringResult componentsSeparatedByString:@" "]];
        return [self sortArrayByCountOfLetter: arrayResult];
    }
    else {
        stringResult = [self replaceAllConsonantsToUpperCase:stringResult];
        NSMutableArray *arrayResult = [self addNumberOfConsonantsForEachWordInArray:[stringResult componentsSeparatedByString:@" "]];
        return [self sortArrayByCountOfLetter:arrayResult];
    }
}

- (BOOL)isSentencePangram {
    NSMutableCharacterSet *allLetterSet= [[NSMutableCharacterSet alloc] init];
    [allLetterSet formUnionWithCharacterSet: NSCharacterSet.lowercaseLetterCharacterSet];
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet characterSetWithCharactersInString: [self lowercaseString]];
    
    NSString *allTheCharsInEng = @"abcdefghijklmnopqrstuvwxyz";
    for (char a = 'a'; a <= 'z'; a++)
    {
        if (![[self lowercaseString] containsString: [NSString stringWithFormat:@"%c", a]]) {
            return false;
        }
    }
    
    return true;
}

- (NSMutableString *)replaceAllVowelsToUpperCase: (NSMutableString *) stringToReplaceVowels {
    NSMutableCharacterSet *vowelsSet = [NSMutableCharacterSet characterSetWithCharactersInString: @"aeiouy"];
    while (true) {
        NSRange range = [stringToReplaceVowels rangeOfCharacterFromSet: vowelsSet];
        if (range.location == NSNotFound) {
            return stringToReplaceVowels;
            break;
        }
        
        stringToReplaceVowels = [stringToReplaceVowels stringByReplacingCharactersInRange:range withString: [[stringToReplaceVowels substringWithRange:range] uppercaseString]];
    }
}

- (NSMutableString *)replaceAllConsonantsToUpperCase: (NSMutableString *) stringToReplaceConsonants {
    NSMutableCharacterSet *consonants = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    [consonants removeCharactersInString: @"aeiouy"];
    while (true) {
        NSRange range = [stringToReplaceConsonants rangeOfCharacterFromSet: consonants];
        if (range.location == NSNotFound) {
            return stringToReplaceConsonants;
            break;
        }
        
        stringToReplaceConsonants = [stringToReplaceConsonants stringByReplacingCharactersInRange:range withString: [[stringToReplaceConsonants substringWithRange:range] uppercaseString]];
    }
}

- (NSArray *)addNumberOfVowelsForEachWordInArray: (NSArray *)wordsArray {
    NSMutableCharacterSet *vowelsSet = [NSMutableCharacterSet characterSetWithCharactersInString: [@"aeiouy" uppercaseString]];
    NSMutableArray *arrayWithNumberOfVowels = [[NSMutableArray alloc] init];
    for (int i = 0; i <  wordsArray.count; i++) {
        if (![wordsArray[i] isEqualToString:@""]) {
            [arrayWithNumberOfVowels addObject: [NSString stringWithFormat:@"%d%@", [wordsArray[i] componentsSeparatedByCharactersInSet:vowelsSet].count - 1, wordsArray[i]]];
        }
    }
    return arrayWithNumberOfVowels;
}

- (NSArray *)addNumberOfConsonantsForEachWordInArray: (NSArray *)wordsArray {
    NSMutableCharacterSet *consonants = [NSMutableCharacterSet uppercaseLetterCharacterSet];
    [consonants removeCharactersInString: [@"aeiouy" uppercaseString]];
    NSMutableArray *arrayWithNumberOfVowels = [[NSMutableArray alloc] init];
    
    for (int i = 0; i <  wordsArray.count; i++) {
        if (![wordsArray[i] isEqualToString:@""]) {
        [arrayWithNumberOfVowels addObject: [NSString stringWithFormat:@"%d%@", [wordsArray[i] componentsSeparatedByCharactersInSet:consonants].count - 1, wordsArray[i]]];
        }
    }
    return arrayWithNumberOfVowels;
}

- (NSString *)sortArrayByCountOfLetter: (NSArray *)notSortedArray {
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSRange rangeForFirstLetter = NSMakeRange(0, 1);

    notSortedArray = [notSortedArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *firstString = [(NSString*)obj1 substringWithRange:rangeForFirstLetter];
         NSString *secondString = [(NSString*)obj2 substringWithRange:rangeForFirstLetter];
         return [firstString compare:secondString options:NSCaseInsensitiveSearch];
    }];
    

    for (int i = 0; i < notSortedArray.count; i++) {
        [resultString appendString:notSortedArray[i]];
        if (i != notSortedArray.count - 1) {
            [resultString appendString:@" "];
        }
    }
    return resultString;
}

@end
