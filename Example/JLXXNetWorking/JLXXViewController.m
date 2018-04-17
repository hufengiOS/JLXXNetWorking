//
//  JLXXViewController.m
//  JLXXNetWorking
//
//  Created by cnsuer on 02/28/2018.
//  Copyright (c) 2018 cnsuer. All rights reserved.
//

#import "JLXXViewController.h"
#import <JLXXNetWorking/JLXXNetWorking.h>


@interface JLXXViewController ()

@end

@implementation JLXXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	
	JLXXRequest *re1 = [[JLXXRequest alloc] initWithRequestUrl:@"/api/11"];
	JLXXRequest *re2 = [[JLXXRequest alloc] initWithRequestUrl:@"/api/22"];
	JLXXRequest *re3 = [[JLXXRequest alloc] initWithRequestUrl:@"/api/33"];
	JLXXRequest *re4 = [[JLXXRequest alloc] initWithRequestUrl:@"/api/44"];
	
	JLXXBatchRequest *batch = [[JLXXBatchRequest alloc] initWithAlwaysRequests:@[re4,re3,re2] sometimeRequests:@[re1]];
	batch.isRefresh = YES;
	
	[batch startWithCompletionBlockWithSuccess:^(JLXXBatchRequest * _Nonnull batchRequest) {
		NSLog(@"%@",batchRequest.successRequests);
	} failure:^(JLXXBatchRequest * _Nonnull batchRequest) {
		
		if ([batchRequest request:re2 inRequestArray:batchRequest.failedRequests]) {
			NSLog(@"re2.requestUrl  %@",re2.requestUrl);
		}
		
	}];
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
