//
//  UIView+Block.h
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Block)
- (void)whenTapped:(void(^)(UIView*))tappedBlock;
@end
