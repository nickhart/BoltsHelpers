//
//  NSData+BoltsHelpers.m
//  Pods
//
//  Created by Nicholas Hart on 8/2/14.
//
//

#import "NSData+BoltsHelpers.h"
#import "NSError+BoltsHelpers.h"

@implementation NSData (BoltsHelpers)

- (BFTask *)bh_writeToURL: (NSURL *) url options: (NSDataWritingOptions) writeOptionsMask {
    BFTaskCompletionSource * taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    if ([url isFileURL]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSError * error;
            BOOL result = [self writeToURL:url options:writeOptionsMask error:&error];
            if (result) {
                [taskCompletionSource setResult:@(result)];
            }
            else {
                [taskCompletionSource setError:error];
            }
        });
    }
    else {
        [taskCompletionSource setError:[NSError bh_errorWithCode:BHResultInvalidParameter description:@"invalid parameter: url is not a file URL"]];
    }
    return taskCompletionSource.task;
}

+ (BFTask *)bh_dataWithContentsOfURL:(NSURL *)url options: (NSDataReadingOptions) readOptionsMask {
    BFTaskCompletionSource * taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    if (url) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSError * error;
            NSData * result = [NSData dataWithContentsOfURL:url options:readOptionsMask error:&error];
            if (result) {
                [taskCompletionSource setResult:result];
            }
            else {
                [taskCompletionSource setError:error];
            }
        });
    }
    else {
        [taskCompletionSource setError:[NSError bh_errorWithCode:BHResultInvalidParameter description:@"invalid parameter: url must not be nil"]];
    }
    return taskCompletionSource.task;
}

@end
