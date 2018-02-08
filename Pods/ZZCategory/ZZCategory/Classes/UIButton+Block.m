//
//  UIControl+Block.m
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>


typedef void(^ButtonEventsBlock)(UIButton *);

@interface UIButton ()

/** 事件回调的block */
@property (nonatomic, copy) ButtonEventsBlock buttonEventsBlock;

@end

@implementation UIButton (Block)

//------- 添加属性 -------//

static void *buttonEventsBlockKey = &buttonEventsBlockKey;

- (ButtonEventsBlock)buttonEventsBlock {
    return objc_getAssociatedObject(self, &buttonEventsBlockKey);
}

- (void)setButtonEventsBlock:(ButtonEventsBlock)buttonEventsBlock {
    objc_setAssociatedObject(self, &buttonEventsBlockKey, buttonEventsBlock, OBJC_ASSOCIATION_COPY);
}

/**
 给按钮绑定事件回调block
 
 @param block 回调的block
 @param controlEvents 回调block的事件
 */
- (void)clickEventHandler:(void (^)(UIButton *))block forControlEvents:(UIControlEvents)controlEvents {
    self.buttonEventsBlock = block;
    [self addTarget:self action:@selector(blcokButtonClicked:) forControlEvents:controlEvents];
}

// 按钮点击
- (void)blcokButtonClicked:(UIButton *)button {
    !self.buttonEventsBlock ?: self.buttonEventsBlock(button);
}

@end
