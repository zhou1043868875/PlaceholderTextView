//
//  XMGPlaceholderTextView.m
//  PlaceholderTextView
//
//  Created by 周新刚 on 16/8/11.
//  Copyright © 2016年 zxg. All rights reserved.
//

#import "XMGPlaceholderTextView.h"
#import "UIView+XMGExtension.h"

@interface XMGPlaceholderTextView()

/* 占位文字的label 为了实现占位文字随着光标上下拖拽效果*/
@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation XMGPlaceholderTextView

/* 占位文字label的懒加载 */
-(UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        
        /*添加一个用于显示占位文字的label*/
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        /*设置xy值是为了让光标显示在合理的位置上，一般设置为47或者38*/
        placeholderLabel.x = 4;
        placeholderLabel.y = 7;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
    }
    return _placeholderLabel;
}

/*通过xib初始化的方法*/
-(void)awakeFromNib{
    // 设置垂直方向有弹簧效果
    self.alwaysBounceVertical = YES;
    
    // 设置默认字体大小和颜色
    self.font = [UIFont systemFontOfSize:15.0f];
    self.placeholderColor = [UIColor grayColor];
    
    // 监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
}

/* 自定义控件初始化*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        // 设置垂直方向有弹簧效果
        self.alwaysBounceVertical = YES;
        
        // 设置默认字体大小和颜色
        self.font = [UIFont systemFontOfSize:15.0f];
        self.placeholderColor = [UIColor grayColor];
        
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

// 移除观察者
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 文字改变事件
- (void)textDidChange{
    /* 根据是否有文字决定占位文字的label的显示和隐藏*/
    self.placeholderLabel.hidden = self.hasText;
}

#pragma mark - 更新占位文字的尺寸的方法
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.placeholderLabel.width = self.width - 2*self.placeholderLabel.x;
    
    [self.placeholderLabel sizeToFit];
}

#pragma mark - 重写需要重新布局的一些属性的setter方法
/* 根据外界设置的占位文字的颜色来显示*/
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

-(void)setPlaceholder:(NSString *)placeholder{
    
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    /*对占位文字赋值后进行刷新占位文字label的size*/
    [self setNeedsLayout];
}

-(void)setFont:(UIFont *)font{
    
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

-(void)setText:(NSString *)text{
    
    [super setText:text];
    
    [self textDidChange];
}

-(void)setAttributedText:(NSAttributedString *)attributedText{
    
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

/**
 * setNeedsDisplay方法 : 会在恰当的时刻自动调用drawRect:方法
 * setNeedsLayout方法 : 会在恰当的时刻调用layoutSubviews方法
 */

@end

