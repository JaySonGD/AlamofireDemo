//
//  UIView+Block.m
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import "UIView+Block.h"

#import <objc/runtime.h>

typedef void(^ViewTappedBlock)(UIView *);

@interface UIView ()

/** 单击手势事件回调的block */
@property (nonatomic, copy) ViewTappedBlock viewTappedBlock;

@end

@implementation UIView (Block)

//------- 添加属性 -------//

static void *viewTappedBlockKey = &viewTappedBlockKey;

- (ViewTappedBlock)viewTappedBlock {
    return objc_getAssociatedObject(self, &viewTappedBlockKey);
}

- (void)setViewTappedBlock:(ViewTappedBlock)viewTappedBlock {
    objc_setAssociatedObject(self, &viewTappedBlockKey, viewTappedBlock, OBJC_ASSOCIATION_COPY);
}

/**
 与单击手势绑定的block
 
 @param tappedBlock 单击手势事件回调的block
 */
- (void)whenTapped:(void(^)(UIView*))tappedBlock {
    self.viewTappedBlock = tappedBlock;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self addGestureRecognizer:tapGesture];
}

// 单击view
- (void)viewTapped {
    !self.viewTappedBlock ?: self.viewTappedBlock(self);
}

@end
