//
//  NSData+BoltsHelpers.h
//  Pods
//
//  Created by Nicholas Hart on 8/2/14.
//
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

/**
 A category to perform some common NSData methods in an asynchronous fashion on a background thread.
 */

@interface NSData (BoltsHelpers)

/**
 Writes the NSData to the specified file url and using the given writing options.  The url must be a file url.
 This method invokes NSData's -writeToUrl:options:error: method on a background queue.  See that method for further details.
 @param url the file url specifying the location to write the data
 @param writeOptionsMask the write options to use
 @return a Bolts task to handle the success or failure of the asynchronous write
 */
- (BFTask *)bh_writeToURL: (NSURL *) url options: (NSDataWritingOptions) writeOptionsMask;

/**
 Reads an NSData from the specified file url and using the given reading options.  The url must be a valid url.
 This method invokes NSData's +dataWithContentsOfURL:options:error: method on a background queue.  See that method for further details.
 @param url the url specifying the location from which to read the data
 @param readOptionsMask the read options to use
 @return a Bolts task to handle the success or failure of the asynchronous read
 */
+ (BFTask *)bh_dataWithContentsOfURL:(NSURL *)url options: (NSDataReadingOptions) readOptionsMask;

@end
