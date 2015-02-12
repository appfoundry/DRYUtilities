//
// Created by Michael Seghers on 12/02/15.
//

#import <Foundation/Foundation.h>

@interface NSString (TemplateReplacement)

/**
Replace all occurrences of the keys in the given dictionary, prefixed with '{' and suffixed with '}', by the description of
the value for that key. This method returns a new String.
*/
- (NSString *)stringByReplacingTemplatesWithValuesFromDictionary:(NSDictionary *)dictionary;

/**
Replace all occurrences of the keys in the given dictionary, prefixed with the given prefix and suffixed with the given suffix,
by the description of the value for that key. This method returns a new String.
*/
- (NSString *)stringByReplacingTemplatesWithValuesFromDictionary:(NSDictionary *)dictionary withTemplatePrefix:(NSString *)prefix templateSuffix:(NSString *)suffix;


@end