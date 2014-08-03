//
//  UIImage+BoltsHelpers.h
//  Pods
//
//  Created by Nicholas Hart on 8/2/14.
//
//

#import <UIKit/UIKit.h>
#import <Bolts/Bolts.h>

@interface UIImage (BoltsHelpers)

- (BFTask *)bh_JPEGRepresentationWithCompressionQuality: (CGFloat) compressionQuality;
- (BFTask *)bh_PNGRepresentation;

@end
