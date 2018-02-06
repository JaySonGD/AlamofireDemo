//
//  UIControl+Block.h
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Block)
- (void)clickEventHandler:(void(^)(UIControl *))block forControlEvents:(UIControlEvents)controlEvents;

@end
