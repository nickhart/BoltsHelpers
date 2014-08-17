//
//  NSError+BoltsHelpers.m
//  Pods
//
//  Created by Nicholas Hart on 8/16/14.
//
//

#import "NSError+BoltsHelpers.h"

NSString * const BHErrorDomain = @"BHErrorDomain";

@implementation NSError (BoltsHelpers)

+ (instancetype)bh_errorWithCode: (NSInteger) code description: (NSString *) description {
    return [NSError errorWithDomain:BHErrorDomain code:code userInfo:@{ NSLocalizedDescriptionKey : description }];
}

@end
