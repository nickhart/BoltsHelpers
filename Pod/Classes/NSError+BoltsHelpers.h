//
//  NSError+BoltsHelpers.h
//  Pods
//
//  Created by Nicholas Hart on 8/16/14.
//
//

#import "BoltsHelpers.h"

extern NSString * const BHErrorDomain;

typedef NS_ENUM(NSInteger, BHResult) {
    BHResultInvalidParameter = -1
};

@interface NSError (BoltsHelpers)

+ (instancetype)bh_errorWithCode: (NSInteger) code description: (NSString *) description;

@end
