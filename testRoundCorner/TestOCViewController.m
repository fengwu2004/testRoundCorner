//
//  TestOCViewController.m
//  testRoundCorner
//
//  Created by ky on 2019/2/21.
//  Copyright © 2019 yellfun. All rights reserved.
//

#import "TestOCViewController.h"
#import "ZObject.h"

@interface TestOCViewController ()

@property(nonatomic) NSThread *thread;

@end

@implementation TestOCViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
    
    [NSThread sleepForTimeInterval:1.5];
    
    NSLog(@"zz");
  }];
  
  _thread = [[NSThread alloc] initWithBlock:^{
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    [timer fire];
    
    [[NSRunLoop currentRunLoop] run];
  }];
  
  [_thread start];
}

@end
