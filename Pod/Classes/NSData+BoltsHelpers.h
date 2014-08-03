//
//  NSData+BoltsHelpers.h
//  Pods
//
//  Created by Nicholas Hart on 8/2/14.
//
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

@interface NSData (BoltsHelpers)

- (BFTask *)bh_writeToURL: (NSURL *) url options: (NSDataWritingOptions) writeOptionsMask;
+ (BFTask *)bh_dataWithContentsOfURL:(NSURL *)url options: (NSDataReadingOptions) readOptionsMask;

@end
