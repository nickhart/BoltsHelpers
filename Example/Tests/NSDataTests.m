//
//  NSDataTests.m
//  BoltsHelpers
//
//  Created by Nicholas Hart on 8/16/14.
//  Copyright (c) 2014 Nicholas Hart. All rights reserved.
//

#import "NSData+BoltsHelpers.h"
#import "NSError+BoltsHelpers.h"

SpecBegin(NSDataTests)

describe(@"these will pass", ^{
    
    __block NSData * testData;
    __block NSURL * tempFileUrl;
    
    beforeEach(^{
        testData = [@"Hello world!" dataUsingEncoding:NSUTF8StringEncoding];
        NSURL * tempDirUrl = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
        tempFileUrl = [tempDirUrl URLByAppendingPathComponent:@"test.dat"];
    });
    
    it(@"requires non-nil file URL", ^{
        BFTask * task = [testData bh_writeToURL:nil options:0];
        expect(task.error.code).to.equal(BHResultInvalidParameter);
        
        task = [testData bh_writeToURL:[NSURL URLWithString:@"http://127.0.0.1"] options:0];
        expect(task.error.code).to.equal(BHResultInvalidParameter);
    });
    
    it(@"will save async", ^AsyncBlock {
        BFTask * task = [testData bh_writeToURL:tempFileUrl options:0];
        expect(task).toNot.equal(nil);
        [task continueWithBlock:^id(BFTask *task) {
            expect(task.error).to.equal(nil);
            expect(task.result).to.equal(@(YES));
            // check the file using standard NSData method...
            NSData * dataFromFile = [NSData dataWithContentsOfURL:tempFileUrl];
            expect(dataFromFile).to.equal(testData);
            done();
            return nil;
        }];
    });
    
    it(@"will load async", ^AsyncBlock {
        // write to disk using standard NSData method...
        NSError * error;
        [testData writeToURL:tempFileUrl options:0 error:&error];
        expect(error).to.equal(nil);
        // now test our task-based version...
        BFTask * task = [NSData bh_dataWithContentsOfURL:tempFileUrl options:0];
        expect(task).toNot.equal(nil);
        [task continueWithBlock:^id(BFTask *task) {
            expect(task.error).to.equal(nil);
            expect(task.result).toNot.equal(nil);
            expect([task.result isKindOfClass:[NSData class]]).to.equal(YES);
            expect(task.result).to.equal(testData);
            done();
            return nil;
        }];
    });
});

SpecEnd
