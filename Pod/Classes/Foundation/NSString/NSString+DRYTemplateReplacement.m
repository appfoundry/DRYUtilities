//
// Created by Michael Seghers on 12/02/15.
//

#import "NSString+DRYTemplateReplacement.h"


@implementation NSString (DRYTemplateReplacement)

- (NSString *)dryStringByReplacingTemplatesWithValuesFromDictionary:(NSDictionary *)dictionary withTemplatePrefix:(NSString *)prefix templateSuffix:(NSString *)suffix {
    NSMutableString *mutable = [self mutableCopy];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *template = [NSString stringWithFormat:@"%@%@%@", prefix, key, suffix];
        [mutable replaceOccurrencesOfString:template withString:[value description] options:NSLiteralSearch range:NSMakeRange(0, [mutable length])];
    }];
    return [mutable copy];
}

- (NSString *)dryStringByReplacingTemplatesWithValuesFromDictionary:(NSDictionary *)dictionary {
    return [self dryStringByReplacingTemplatesWithValuesFromDictionary:dictionary withTemplatePrefix:@"{" templateSuffix:@"}"];
}

@end