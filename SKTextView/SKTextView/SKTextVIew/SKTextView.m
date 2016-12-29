//
//  SKTextView.m
//  SKTextView
//
//  Created by pactera on 2016/12/20.
//  Copyright © 2016年 songke. All rights reserved.
//

#import "SKTextView.h"

@interface SKTextView ()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, copy) NSString *placeholder;
@end

@implementation SKTextView

#pragma mark - 自定义初始化方法
- (instancetype)initWithFrame:(CGRect)frame Placeholder:(NSString *)placeholder {
    _textFont = [UIFont systemFontOfSize:17];
    _placeholder = placeholder;
    return [self initWithFrame:frame];
}

#pragma mark - 生命周期
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textView];
        [self addSubview:self.placeholderLabel];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGSize placeholderSize = [self.placeholder boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textFont} context:nil].size;
    self.placeholderLabel.frame = CGRectMake(5, 7, self.frame.size.width, placeholderSize.height);
    self.textView.frame = self.bounds;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    self.placeholderLabel.hidden = (textView.text.length > 0);
}

#pragma mark - 私有方法
- (void)placeholderLabelTouch:(UITapGestureRecognizer *)tap {
    [self.textView resignFirstResponder];
}

#pragma mark - 暴露在外的方法
- (NSString *)getTextViewContent {
    return self.textView.text;
}

#pragma mark - 懒加载属性
- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _placeholderLabel.text = self.placeholder;
        _placeholderLabel.font = self.textFont;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.textColor = [UIColor darkGrayColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeholderLabelTouch:)];
        [_placeholderLabel addGestureRecognizer:tap];
    }
    return _placeholderLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectZero];
        _textView.font = self.textFont;
        _textView.delegate = self;
    }
    return _textView;
}

#pragma mark - setter
- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.placeholderLabel.font = textFont;
    self.textView.font = textFont;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textView.textColor = textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setBgColor:(UIColor *)bgColor {
    self.backgroundColor = bgColor;
    self.textView.backgroundColor = bgColor;
    self.placeholderLabel.backgroundColor = bgColor;
}

@end
