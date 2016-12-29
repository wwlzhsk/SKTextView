//
//  ViewController.m
//  SKTextView
//
//  Created by pactera on 2016/12/20.
//  Copyright © 2016年 songke. All rights reserved.
//

#import "ViewController.h"
#import "SKTextView.h"

@interface ViewController ()

@property (nonatomic, strong) SKTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    SKTextView *textView = [[SKTextView alloc] initWithFrame:CGRectMake(50, 50, 200, 200) Placeholder:@"请输入你需要的！！！"];
    self.textView = textView;
    
    textView.textFont = [UIFont systemFontOfSize:12];
    textView.textColor = [UIColor redColor];
    textView.placeholderColor = [UIColor blueColor];
    
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",self.textView.getTextViewContent);
}

@end
