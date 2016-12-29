//
//  SKTextView.h
//  SKTextView
//
//  Created by pactera on 2016/12/20.
//  Copyright © 2016年 songke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKTextView : UIView

/** 初始化方法 */
- (instancetype)initWithFrame:(CGRect)frame Placeholder:(NSString *)placeholder;

/** 获取输入框内容 */
- (NSString *)getTextViewContent;

/**文字大小 */
@property (nonatomic, strong) UIFont *textFont;

/**文字颜色 默认为黑色*/
@property (nonatomic, strong) UIColor *textColor;

/**placeholder文字颜色 默认为深灰色*/
@property (nonatomic, strong) UIColor *placeholderColor;

/**背景颜色 默认为白色*/
@property (nonatomic, strong) UIColor *bgColor;

@end
