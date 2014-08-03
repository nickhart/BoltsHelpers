//
//  UIImage+BoltsHelpers.m
//  Pods
//
//  Created by Nicholas Hart on 8/2/14.
//
//

#import "UIImage+BoltsHelpers.h"

@implementation UIImage (BoltsHelpers)

- (BFTask *)bh_JPEGRepresentationWithCompressionQuality: (CGFloat) compressionQuality {
    BFTaskCompletionSource * taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData * data = UIImageJPEGRepresentation(self, compressionQuality);
        [taskCompletionSource setResult:data];
    });
    return taskCompletionSource.task;
}

- (BFTask *)bh_PNGRepresentation {
    BFTaskCompletionSource * taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData * data = UIImagePNGRepresentation(self);
        [taskCompletionSource setResult:data];
    });
    return taskCompletionSource.task;
}

@end
