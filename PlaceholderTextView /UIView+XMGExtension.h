//
//  UIView+XMGExtension.h
//  PlaceholderTextView
//
//  Created by 周新刚 on 16/8/11.
//  Copyright © 2016年 zxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMGExtension)
//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end
