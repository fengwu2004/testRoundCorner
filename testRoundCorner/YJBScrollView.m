//
//  YJBScrollView.m
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

#import "YJBScrollView.h"

@implementation YJBScrollView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIScrollView *superview = (UIScrollView *)self.superview;
    
    while (![superview isKindOfClass:[UIScrollView class]] || superview == nil) {
        
        superview = (UIScrollView *)superview.superview;
    }
    
    if (superview == nil) {
        
        return [super hitTest:point withEvent:event];
    }
    
    CGSize backUpContentSize = superview.contentSize;
    
    if (superview != nil && superview.contentSize.width <= superview.bounds.size.width) {
        
        superview.contentSize = CGSizeMake(superview.bounds.size.width + 0.5, superview.contentSize.height);
    }
    
    UIView *view =  [super hitTest:point withEvent:event];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        superview.contentSize = backUpContentSize;
    });
    
    return view;
}

@end
