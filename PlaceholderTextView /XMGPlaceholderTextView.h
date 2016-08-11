//
//  XMGPlaceholderTextView.h
//  PlaceholderTextView
//
//  Created by 周新刚 on 16/8/11.
//  Copyright © 2016年 zxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGPlaceholderTextView : UITextView

/* 占位文字 */
@property (nonatomic, strong) NSString *placeholder;
/* 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
