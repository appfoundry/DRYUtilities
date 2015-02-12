//
// Created by Michael Seghers on 12/02/15.
//

#import <Foundation/Foundation.h>

@interface NSString (DRYTemplateReplacement)

- (NSString *)dryStringByReplacingTemplatesWithValuesFromDictionary:(NSDictionary *)dictionary;

@end